import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mari_nail_app/core/configs/app_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mari_nail_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/data/model/register_response.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final http.Client customHttp;
  final SharedPreferences sharedPreferences;

  AuthDataSourceImpl({
    required this.customHttp,
    required this.sharedPreferences,
  });

  @override
  Future<LoginResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await customHttp.post(
      Uri.parse(AppConfigs.loginEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      return LoginResponse.fromJson(jsonData);
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['message'] ?? 'Failed to log in');
    }
  }

  @override
  Future<RegisterResponse> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  }) async {
    final uri = Uri.parse(AppConfigs.registerEndpoint);
    final request = http.MultipartRequest('POST', uri);

    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['fullName'] = fullName;
    request.fields['phoneNumber'] = phoneNumber;
    request.fields['gender'] = gender;

    if (profileImage != null) {
      final multipartFile = await http.MultipartFile.fromPath(
        'profileImage',
        profileImage.path,
      );
      request.files.add(multipartFile);
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return RegisterResponse.fromSuccessText(response.body);
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['error'] ?? 'Registration failed');
    }
  }

  @override
  Future<void> verifyOtp({required String email, required String otp}) async {
    final response = await customHttp.post(
      Uri.parse(AppConfigs.verifyOtpEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      final accessToken = jsonData['accessToken'] as String;
      final refreshToken = jsonData['refreshToken'] as String;

      await sharedPreferences.setString('access_token', accessToken);
      await sharedPreferences.setString('refresh_token', refreshToken);
    } else {
      String errorMsg = 'OTP verification failed';
      if (response.body.trim().isNotEmpty) {
        try {
          final errorData = jsonDecode(response.body);
          errorMsg = errorData['message'] ?? errorMsg;
        } catch (_) {}
      }
      throw Exception(errorMsg);
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    final response = await customHttp.post(
      Uri.parse(AppConfigs.forgotPasswordEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return;
    }

    String errorMsg = 'Failed to request password reset.';
    if (response.body.trim().isNotEmpty) {
      try {
        final data = jsonDecode(response.body);
        errorMsg = data['message'] ?? data['status'] ?? errorMsg;
      } catch (_) {}
    }
    throw Exception(errorMsg);
  }

  @override
  Future<void> resetPassword({required String newPassword}) async {
    final token = sharedPreferences.getString('access_token') ?? '';

    final response = await customHttp.post(
      Uri.parse(AppConfigs.resetPasswordEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'newPassword': newPassword}),
    );

    if (response.statusCode != 200) {
      String errorMsg = 'Invalid OTP or expired';
      if (response.body.trim().isNotEmpty) {
        try {
          final errorData = jsonDecode(response.body);
          errorMsg = errorData['message'] ?? errorMsg;
        } catch (_) {}
      }
      throw Exception(errorMsg);
    }
  }
}

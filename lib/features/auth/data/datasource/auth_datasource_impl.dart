import 'dart:convert';
import 'dart:developer';
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
  }) async {
    try {
      final response = await customHttp.post(
        Uri.parse(AppConfigs.registerEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        return RegisterResponse.fromSuccessText(response.body);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['error'] ?? 'Registration failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> verifyOtp({required String email, required String otp}) async {
    try {
      final response = await customHttp.post(
        Uri.parse(AppConfigs.verifyOtpEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        final accessToken = jsonData['accessToken'] as String;
        final refreshToken = jsonData['refreshToken'] as String;

        await sharedPreferences.setString('accessToken', accessToken);
        await sharedPreferences.setString('refreshTtoken', refreshToken);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> completeProfile({
    required String fullName,
    required String userName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  }) async {
    try {
      final token = sharedPreferences.getString('accessToken') ?? '';
      final uri = Uri.parse(AppConfigs.completeProfileEndpoint);
      final request = http.MultipartRequest('POST', uri);

      request.headers.addAll({'Authorization': 'Bearer $token'});
      print(token);
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
      final streamedResponse = await customHttp.send(request);
      final response = await http.Response.fromStream(streamedResponse);
      log(response.body);

      if (response.statusCode == 200) {
        await sharedPreferences.setString('user_name', fullName);
        await sharedPreferences.setString('user_phone', phoneNumber);
        return;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      final response = await customHttp.post(
        Uri.parse(AppConfigs.forgotPasswordEndpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        final data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> resetPassword({required String newPassword}) async {
    try {
      final token = sharedPreferences.getString('access_token') ?? '';

      final response = await customHttp.post(
        Uri.parse(AppConfigs.resetPasswordEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'newPassword': newPassword}),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['messsage']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  bool hasToken() {
    final acccessToken = sharedPreferences.getString('accessToken');
    final refreshToken = sharedPreferences.getString('refreshToken');
    return acccessToken != null &&
        refreshToken != null &&
        acccessToken.isNotEmpty &&
        refreshToken.isNotEmpty;
  }
}

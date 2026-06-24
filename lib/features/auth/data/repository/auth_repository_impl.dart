import 'dart:io';
import 'package:mari_nail_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/data/model/register_response.dart';
import 'package:mari_nail_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl({required this._authDataSource});

  @override
  Future<LoginResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _authDataSource.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<RegisterResult> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  }) async {
    return await _authDataSource.registerUser(
      email: email,
      password: password,
      fullName: fullName,
      phoneNumber: phoneNumber,
      gender: gender,
      profileImage: profileImage,
    );
  }

  @override
  Future<void> verifyOtp({required String email, required String otp}) async {
    return await _authDataSource.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<void> forgotPassword({required String email}) {
    return _authDataSource.forgotPassword(email: email);
  }

  @override
  Future<void> resetPassword({required String newPassword}) {
    return _authDataSource.resetPassword(newPassword: newPassword);
  }
}

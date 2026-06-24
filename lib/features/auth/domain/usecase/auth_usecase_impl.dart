import 'dart:io';

import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/data/model/register_response.dart';
import 'package:mari_nail_app/features/auth/domain/repository/auth_repository.dart';
import 'package:mari_nail_app/features/auth/domain/usecase/auth_usecase.dart';

class AuthUsecaseImpl implements AuthUseCase {
  final AuthRepository _authRepository;

  AuthUsecaseImpl({required this._authRepository});

  @override
  Future<LoginResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _authRepository.loginWithEmailAndPassword(
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
    return await _authRepository.registerUser(
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
    return await _authRepository.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<void> executeForgotPassword({required String email}) {
    return _authRepository.forgotPassword(email: email);
  }

  @override
  Future<void> executeResetPassword({required String newPassword}) {
    return _authRepository.resetPassword(newPassword: newPassword);
  }
}

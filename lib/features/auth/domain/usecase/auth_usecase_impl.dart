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
  Future<RegisterResponse> registerUser({
    required String email,
    required String password,
  }) async {
    return await _authRepository.registerUser(email: email, password: password);
  }

  @override
  Future<void> verifyOtp({required String email, required String otp}) async {
    return await _authRepository.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<void> forgotPassword({required String email}) {
    return _authRepository.forgotPassword(email: email);
  }

  @override
  Future<void> resetPassword({required String newPassword}) {
    return _authRepository.resetPassword(newPassword: newPassword);
  }

  @override
  Future<void> completeProfile({
    required String fullName,
    required String userName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  }) async {
    return await _authRepository.completeProfile(
      fullName: fullName,
      userName: userName,
      phoneNumber: phoneNumber,
      gender: gender,
      profileImage: profileImage,
    );
  }

  @override
  bool isAuthenticated() {
    return _authRepository.isAuthenticated();
  }
}

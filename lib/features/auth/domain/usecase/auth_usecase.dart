import 'dart:io';

import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/data/model/register_response.dart';

abstract interface class AuthUseCase {
  Future<LoginResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<RegisterResponse> registerUser({
    required String email,
    required String password,
  });

  Future<void> completeProfile({
    required String fullName,
    required String userName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  });
  bool isAuthenticated();

  Future<void> verifyOtp({required String email, required String otp});

  Future<void> forgotPassword({required String email});
  Future<void> resetPassword({required String newPassword});
}

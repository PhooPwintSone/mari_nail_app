import 'dart:io';

import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/data/model/register_response.dart';

abstract interface class AuthRepository {
  Future<LoginResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<RegisterResult> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  });

  Future<void> verifyOtp({required String email, required String otp});

  Future<void> forgotPassword({required String email});
  Future<void> resetPassword({required String newPassword});
}

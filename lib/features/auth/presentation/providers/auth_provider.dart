import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/domain/usecase/auth_usecase.dart';

class AuthProvider with ChangeNotifier {
  final AuthUseCase _authUseCase;

  AuthProvider({required this._authUseCase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  LoginResponse? _loginResponse;
  LoginResponse? get loginResponse => _loginResponse;

  String _userEmail = '';
  String get userEmail => _userEmail;

  String _userFullName = '';
  String get userFullName => _userFullName;

  bool _isAuthebticated = false;
  bool get isAuthebticated => _isAuthebticated;

  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authUseCase.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loginResponse = response;
      _userEmail = email;
      _userFullName = email.split('@').first;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void authebticated(bool value) {
    _isAuthebticated = value;
    notifyListeners();
  }

  Future<bool> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.registerUser(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber,
        gender: gender,
        profileImage: profileImage,
      );
      _userEmail = email;
      _userFullName = fullName;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp({required String otp}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.verifyOtp(email: _userEmail, otp: otp);
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> sendForgotPasswordOtp({required String email}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.executeForgotPassword(email: email);
      _userEmail = email; // Cache it securely
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> finalizeResetPassword({required String newPassword}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.executeResetPassword(newPassword: newPassword);
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

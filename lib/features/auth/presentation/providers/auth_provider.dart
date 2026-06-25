import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mari_nail_app/features/auth/data/model/login_response.dart';
import 'package:mari_nail_app/features/auth/domain/usecase/auth_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

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

      final prefs = await SharedPreferences.getInstance();

      final String token = response.tokenPair.accessToken;

      if (token != null) {
        await prefs.setString('accessToken', token);
      }

      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void authenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  Future<bool> registerUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.registerUser(email: email, password: password);
      _userEmail = email;
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

  Future<bool> completeUserProfile({
    required String fullName,

    required String userName,
    required String phoneNumber,
    required String gender,
    File? profileImage,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.completeProfile(
        fullName: fullName,
        userName: userName,
        phoneNumber: phoneNumber,
        gender: gender,
      );
      _userFullName = fullName;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception', '');
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
      await _authUseCase.forgotPassword(email: email);
      _userEmail = email;
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> resetPassword({required String newPassword}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authUseCase.resetPassword(newPassword: newPassword);
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken');

      _loginResponse = null;
      _userEmail = '';
      _userFullName = '';
    } catch (e) {
      _errorMessage = "Failed to log out cleanly: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

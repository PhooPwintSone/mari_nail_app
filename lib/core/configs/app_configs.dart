class AppConfigs {
  AppConfigs._();

  //About auth

  static const String authBaseUrl = 'http://192.168.0.182:8080';
  static const String loginEndpoint = '$authBaseUrl/api/auth/login';
  static const String registerEndpoint = '$authBaseUrl/api/auth/signup/init';
  static const String completeProfileEndpoint =
      '$authBaseUrl/api/auth/signup/complete-profile';

  static const String verifyOtpEndpoint = '$authBaseUrl/api/auth/verify-otp';
  static const String forgotPasswordEndpoint =
      '$authBaseUrl/api/auth/forgot-password';
  static const String resetPasswordEndpoint =
      '$authBaseUrl/api/auth/reset-password';

  static const String categoriesEndpoint = '$authBaseUrl/api/categories';
  static const String servicesEndpoint = '$authBaseUrl/api/services';
}

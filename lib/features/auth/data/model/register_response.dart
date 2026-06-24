class RegisterResponse extends RegisterResult {
  RegisterResponse({required super.message, required super.isSuccess});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String? ?? 'Registration failed',
      isSuccess: false,
    );
  }

  factory RegisterResponse.fromSuccessText(String message) {
    return RegisterResponse(message: message, isSuccess: true);
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'success': isSuccess};
  }
}

class RegisterResult {
  final String message;
  final bool isSuccess;

  const RegisterResult({required this.message, required this.isSuccess});
}

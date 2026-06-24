class LoginResponse {
  final TokenPair tokenPair;

  const LoginResponse({required this.tokenPair});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(tokenPair: TokenPair.fromJson(json['tokenPair']));
  }
}

class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair({required this.accessToken, required this.refreshToken});

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}

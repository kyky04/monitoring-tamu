class LoginResult {
  String accessToken;
  String tokenType;
  int expiresIn;

  String error;
  int code;

  LoginResult({this.accessToken, this.tokenType, this.expiresIn});

  LoginResult.fromJson(int statusCode,Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    code = statusCode;
  }

  LoginResult.withError(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}


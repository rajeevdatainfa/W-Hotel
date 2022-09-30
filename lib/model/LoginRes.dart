class LoginRes{
  String? message;
  AuthData? data;

  LoginRes({this.message, this.data});

  LoginRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new AuthData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AuthData {
  String? username;
  String? token;

  AuthData({this.username, this.token});

  AuthData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['token'] = this.token;
    return data;
  }
}
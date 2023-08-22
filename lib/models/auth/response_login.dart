
import '../other/header.dart';

class LoginResponse {

  Header? header;
  Body? body;

  LoginResponse({this.header, this.body});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null ? new Header.fromJson(json['header']) : null;
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? accessToken;
  int? expiresIn;
  String? refreshToken;
  String? scope;
  String? tokenType;

  Body(
      {this.accessToken,
        this.expiresIn,
        this.refreshToken,
        this.scope,
        this.tokenType});

  Body.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresIn = json['expiresIn'];
    refreshToken = json['refreshToken'];
    scope = json['scope'];
    tokenType = json['tokenType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiresIn'] = this.expiresIn;
    data['refreshToken'] = this.refreshToken;
    data['scope'] = this.scope;
    data['tokenType'] = this.tokenType;
    return data;
  }
}

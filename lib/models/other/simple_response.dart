


import 'package:training_project/models/other/header.dart';

class SimpleResponse {
  Header? header;
  SimpleResponseBody? body;

  SimpleResponse({this.header, this.body});

  SimpleResponse.fromJson(Map<String, dynamic> json) {
    header =
    json['header'] != null ? Header.fromJson(json['header']) : null;
    body = json['body'] != null ? SimpleResponseBody.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class SimpleResponseBody {
  bool? status;
  String? message;

  SimpleResponseBody({this.status, this.message});

  SimpleResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:training_project/helper/helper_export.dart';
import 'package:training_project/models/model_export.dart';

import 'config/api_service.dart';
import 'end_point/auth_end_point.dart';


class Auth{

  checkToken(context) async {
    final response = await http.post(Uri.parse(apiUrl + AuthEndpoint.checkToken),
        headers: APIService.header(),
        );
    if (response.statusCode == 200) {
      log('Check Token Response : ${response.body}' );
      return CheckTokenResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load to server!!');
    }
  }

   login(String deviceId, String deviceName, String password, String username)  async {

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl + AuthEndpoint.login));

    request.fields['deviceId'] = deviceId;
    request.fields['deviceName'] = deviceName;
    request.fields['password'] = password;
    request.fields['username'] = username;

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      log('Login Response : ${response.body}' );
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load to server!!');
    }
  }

  logout(String deviceId)  async {

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl + AuthEndpoint.logout));

    request.headers.addAll(APIService.header());
    request.fields['deviceId'] = deviceId;

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      log('Logout Response : ${response.body}' );
      return SimpleResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load to server!!');
    }
  }



}
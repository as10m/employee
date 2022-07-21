import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Data_Model/login_response.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<LoginResponse?> getLoginResponse(@required String email,
      @required String password) async {
    var post_body = jsonEncode({"email": "${email}", "password": "$password"});
    print(post_body);

    final response = await http.post(Uri.parse(' https://reqres.in/api/login'));
    print(response.body);
  }
}
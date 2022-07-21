import 'dart:convert';

import 'package:employee/Data_Model/employee_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Employee {
  Future<EmployeeResponse?> getEmployeeResponse(@required String name ,
      @required String job) async {
    var post_body = jsonEncode({"name": "${name}", "job": "$job"});
    print(post_body);

    final response = await http.post(Uri.parse(' https://reqres.in/api/users'));
    print(response.body);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Repository/auth_repository.dart';
import 'add_employee.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontSize: 25),),
              SizedBox(height: 50),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18)
                  )
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18)
                  )
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(onPressed: (){
                onPressedLogin();
              },
                  child: Text('Login',style: TextStyle(fontSize: 20),)
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void>onPressedLogin() async {
    var email = _emailController.text.toString();
    var password = _passwordController.text.toString();


    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {

      var response = await http.post(Uri.parse('https://reqres.in/api/login'),
    body:({'email':_emailController.text,'password':_passwordController.text}));
      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddEmployee()));
      }
    } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed"),));
    }
   }
}

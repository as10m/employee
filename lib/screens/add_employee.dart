import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                 controller: _nameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                 controller: _jobController,
                decoration: InputDecoration(
                    hintText: 'enter job',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(onPressed: (){
                onPressedSubmit();
              },
                  child: Text('Submit',style: TextStyle(fontSize: 20),)
              )
            ],
          ),
        ),
      ),
    );
  }

  Future <void> onPressedSubmit() async {
    if (_nameController.text.isNotEmpty && _jobController.text.isNotEmpty) {

      var response = await http.post(Uri.parse('https://reqres.in/api/users'),
    body:({'name':_nameController.text,'job':_jobController.text}));
      if (response.statusCode == 201) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Details()));
        }
      } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter details"),));
      }
  }
}

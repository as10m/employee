import 'package:employee/Repository/employee_repository.dart';
import 'package:employee/data_model/list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  int currentPage = 1;
  List<Employee> Employees = [];
  Future<bool> getEmployeeData() async{
    final Uri uri = Uri.parse("https://reqres.in/api/users?page=$currentPage");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = EmployeeListFromJson(response.body);

      Employees = result.data.cast<Employee>();
      currentPage++;
      print(response.body);
      setState(() {

      });
      return true;
    }else{
      return false;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmployeeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context,index){
            final Employee = Employees[index];

            return ListTile(
              title: Text("Title 1"),
              subtitle: Text("Subtitle 1"),
            );
          },
          separatorBuilder: (context,index){
            return Divider();
          },
          itemCount: Employees.length),

    );
  }
}

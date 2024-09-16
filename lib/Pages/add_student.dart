import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:student_attendance/service/database.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController matriculecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController deptcontroller = TextEditingController();
  TextEditingController telephonenocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined),
                  SizedBox(
                    width: 80.0,
                  ),
                  Text(
                    "Add ",
                    style: TextStyle(
                        color: Colors.orange[800],
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Student",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Student Name ",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Enter Student Name"),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Student Matricule ",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: TextField(
                  controller: matriculecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Student Matricule"),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "Student E-mail ",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Student E-mail"),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "Student Dep't ",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: TextField(
                  controller: deptcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Student Dep't"),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "Student Telephone N°",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: TextField(
                  controller: telephonenocontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Student Telephone N°"),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              GestureDetector(
                onTap: () async {
                  if (namecontroller.text != "" &&
                      matriculecontroller.text != "" &&
                      emailcontroller.text != "" &&
                      deptcontroller.text != "" &&
                      telephonenocontroller != "") {
                    String addID = randomAlphaNumeric(10);
                    Map<String, dynamic> StudentInfoMap = {
                      "Name": namecontroller.text,
                      "Matricule": matriculecontroller.text,
                      "E-mail": emailcontroller.text,
                      "Dep't": deptcontroller.text,
                      "Telephone N°": telephonenocontroller.text,
                    };
                    await DatabaseMethods()
                        .addStudent(StudentInfoMap, addID)
                        .then((value) {
                          namecontroller.text="";
                          matriculecontroller.text="";
                          emailcontroller.text="";
                          deptcontroller.text="";
                          telephonenocontroller.text="";
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Student data has been uploaded!!!",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )));
                    });
                  }
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  const Text(
                    "Here to Get",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  const Text(
                    "Welcomed !",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.abc),
                          border: OutlineInputBorder(),
                          labelText: "Enter your Full name"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "The Name is empity";
                        } else if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Corrent name";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: "Enter your number"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "The Phone Number is empity";
                        } else if (value != null && value.length < 13) {
                          return "Enter the corrent phone number by begin with +251";
                        } else if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,9}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value!)) {
                          return "Enter Corrent phone number";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: "Enter yout email"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "The email is empity";
                        } else if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)[\w]{2,4}')
                                .hasMatch(value!)) {
                          return "Enter Corrent email";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: "Enter yout Passowrd"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "The password is empity";
                        } else if (value != null && value.length < 7) {
                          return "Enter minmum length is 7 Characters";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "sign up",
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF364f93)),
                      ),
                      NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final snackBar = SnackBar(
                                content: const Text('Submitting form'));
                            _scaffoldKey.currentState!.showSnackBar(snackBar);
                          }
                        },
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.circle()),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Sign in"), Text("Forget Passord")],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

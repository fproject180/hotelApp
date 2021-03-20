import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100.0, width: MediaQuery.of(context).size.width),
            Container(
              child: Text(
                "REGISTER",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(height: 40.0),
            CupertinoTextField(
              placeholder: "Name",
              // controller: emailController,
              padding: EdgeInsets.all(15.0),
            ),
            SizedBox(height: 40.0),
            CupertinoTextField(
                placeholder: "Mobile",
                // controller: passwordController,
                padding: EdgeInsets.all(15.0)),
            SizedBox(height: 40.0),
            CupertinoTextField(
                placeholder: "Email", padding: EdgeInsets.all(15.0)),
            SizedBox(height: 40.0),
            CupertinoTextField(
                placeholder: "Password", padding: EdgeInsets.all(15.0)),
            SizedBox(height: 35.0, width: MediaQuery.of(context).size.width),
            IconButton(
              icon: Icon(CupertinoIcons.person_add),
              iconSize: 70.0,
              // onPressed: () async {
              //   final String email = emailController.text;
              //   final String password = passwordController.text;
              //   var _userLogin =
              //       await loginWithEmailAndPassword(email, password);
              //   Navigator.of(context)
              //       .push(CupertinoPageRoute(builder: (context) => HomePage()));
            ),
          ],
        ),
      ),
    );
  }
}

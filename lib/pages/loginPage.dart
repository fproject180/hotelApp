import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelmain/pages/homePage.dart';
import 'package:hotelmain/services/loginService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<LoginUser> loginWithEmailAndPassword(email, password) async {
  final String apiUrl = "http://192.168.1.28:3000/loginRoute";
  Response response = await Dio().post(apiUrl, data: {
    "email": email,
    "password": password,
  });
  if (response == 200) {
    final String responseString = response.data;
    return loginUserFromJson(responseString);
  } else {
    return null;
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginUser _loginUser;

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
            SizedBox(height: 130.0, width: MediaQuery.of(context).size.width),
            Container(
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(height: 40.0),
            CupertinoTextField(
              placeholder: "Email",
              controller: emailController,
              padding: EdgeInsets.all(20.0),
            ),
            SizedBox(height: 40.0),
            CupertinoTextField(
                placeholder: "Password",
                controller: passwordController,
                padding: EdgeInsets.all(20.0)),
            SizedBox(height: 50.0, width: MediaQuery.of(context).size.width),
            IconButton(
              icon: Icon(Icons.send_outlined),
              iconSize: 70.0,
              onPressed: () async {
                final String email = emailController.text;
                final String password = passwordController.text;
                var _userLogin =
                    await loginWithEmailAndPassword(email, password);
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelmain/pages/homePage.dart';
import 'package:hotelmain/pages/registerPage.dart';
import 'package:hotelmain/services/loginService.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<LoginUser> loginWithEmailAndPassword(email, password) async {
  final String apiUrl = "https://f5e91fde0038.ngrok.io/loginRoute";
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
      backgroundColor: Colors.tealAccent,
      // appBar: AppBar(
      //   title: Text("Hotel"),
      //   backgroundColor: Colors.red,
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Lottie.asset('assets/login.json', height: 150.0),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "LOGIN",
              style: TextStyle(fontSize: 60, fontFamily: "homeAway"),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 350.0,
                width: double.infinity,
                child: Card(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            // hintText: "Email",
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 2.0,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Not a member?",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 5.0),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: TextButton(
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                              },
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                      SizedBox(height: 10.0),
                      CupertinoButton(
                        child: Text(
                          "Submit",
                        ),
                        color: CupertinoColors.activeBlue,
                        onPressed: () async {
                          final String email = emailController.text;
                          final String password = passwordController.text;
                          var _userLogin =
                              await loginWithEmailAndPassword(email, password);
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => HomePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

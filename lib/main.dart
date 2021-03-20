import 'package:flutter/material.dart';
// import 'package:hotelmain/pages/homePage.dart';
import 'package:hotelmain/pages/loginPage.dart';
import 'package:hotelmain/pages/registerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hotelmain/pages/loginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
      home: Container(
        child: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/splash.gif',
            fit: BoxFit.fill,
          ),
          splashIconSize: double.infinity,
          nextScreen: LoginPage(),
          duration: 5000,
        ),
      ),
    );
  }
}

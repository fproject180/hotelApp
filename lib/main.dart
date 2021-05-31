import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotelmain/pages/homePage1.dart';
import 'package:hotelmain/pages/loginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hotelmain/services/authenticationService.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authstateChanges),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthenticationWrapper(), //Container(
        //   child: AnimatedSplashScreen(
        //     splash: Image.asset(
        //       'assets/splash.gif',
        //       fit: BoxFit.fill,
        //     ),
        //     splashIconSize: double.infinity,
        //     nextScreen: LoginPage(),
        //     duration: 5000,
        //   ),
        // ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return homePage();
    }
    return LoginPage();
  }
}

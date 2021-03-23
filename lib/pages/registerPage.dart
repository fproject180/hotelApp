import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelmain/pages/amenities.dart';
import "package:lottie/lottie.dart";

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            child: Column(children: [
          SizedBox(
            height: 50.0,
          ),
          Lottie.asset('assets/register.json', height: 150.0),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "REGISTER",
            style: TextStyle(fontSize: 50.0, fontFamily: "homeAway"),
          ),
          SizedBox(height: 3.0),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 470.0,
                width: double.infinity,
                child: Card(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            // controller: emailController,
                            decoration: InputDecoration(
                              // hintText: "Email",
                              labelText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            // controller: passwordController,
                            decoration: InputDecoration(
                                labelText: "Mobile No",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            // controller: passwordController,
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            // controller: passwordController,
                            decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CupertinoButton(
                          child: Text(
                            "Submit",
                          ),
                          color: CupertinoColors.activeBlue,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AmenitiesPage()));
                          },
                        ),
                      ],
                    )),
              )),
        ])));
  }
}

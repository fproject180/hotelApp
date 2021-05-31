import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Image.asset(
                    "assets/hotel.gif",
                    height: 240.0,
                    width: 240.0,
                  ),
                  // Lottie.asset('assets/hotels.json', height: 175.0),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Hotels",
                    style: TextStyle(fontSize: 70.0, fontFamily: "homeAway"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 315.0,
                    width: 300.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.lightBlueAccent,
                      child: Column(
                        children: [
                          Text(
                            "Pune",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.w100),
                          ),
                          Container(
                            child: Image.asset(
                              "assets/pune.png",
                              height: 180.0,
                              width: 180.0,
                            ),
                          ),
                          CupertinoButton(
                            onPressed: () {},
                            child: Text(
                              "MARRIOT",
                              style: TextStyle(fontFamily: "Pacifico"),
                            ),
                            color: CupertinoColors.activeGreen,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

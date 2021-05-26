import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelmain/pages/bookingConfirm.dart';
import 'package:lottie/lottie.dart';
import 'package:hotelmain/pages/bookingInformation.dart';

class selectAppliancePage extends StatefulWidget {
  @override
  _selectAppliancePageState createState() => _selectAppliancePageState();
}

class _selectAppliancePageState extends State<selectAppliancePage> {
  Color _acColor = Colors.black;
  Color _lightColor = Colors.black;
  Color _cafeColor = Colors.black;
  Color _tvColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      // color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: 70.0,
          ),
          Center(
            child: Lottie.asset(
              "assets/appliance.json",
              height: 230.0,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "Select Appliances",
            style: TextStyle(fontSize: 50.0, fontFamily: "homeAway"),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.ac_unit_outlined),
                      color: _acColor,
                      onPressed: () {
                        setState(() {
                          if (_acColor == Colors.black) {
                            _acColor = Colors.yellow;
                          } else {
                            _acColor = Colors.black;
                          }
                        });
                      },
                      iconSize: 70.0,
                    ),
                    Text("AC"),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                  width: 80.0,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.lightbulb_outline),
                      color: _lightColor,
                      onPressed: () {
                        setState(() {
                          if (_lightColor == Colors.black) {
                            _lightColor = Colors.yellow;
                          } else {
                            _lightColor = Colors.black;
                          }
                        });
                      },
                      iconSize: 70.0,
                    ),
                    Text("Lights"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.local_cafe_outlined),
                      color: _cafeColor,
                      onPressed: () {
                        setState(() {
                          if (_cafeColor == Colors.black) {
                            _cafeColor = Colors.yellow;
                          } else {
                            _cafeColor = Colors.black;
                          }
                        });
                      },
                      iconSize: 70.0,
                    ),
                    Text("Coffee-Maker"),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                  width: 80.0,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.live_tv_outlined),
                      color: _tvColor,
                      onPressed: () {
                        setState(() {
                          if (_tvColor == Colors.black) {
                            _tvColor = Colors.yellow;
                          } else {
                            _tvColor = Colors.black;
                          }
                        });
                      },
                      iconSize: 70.0,
                    ),
                    Text("Television"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "*Appliances are not inclusive of Basic charges",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
            child: CupertinoButton(
                child: Text("Select"),
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  setState(() {});
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          elevation: 15,
                          child: Container(
                            height: 700.0,
                            width: 600.0,
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 3.0,
                                ),
                                Center(
                                  child: Text(
                                    "Confirmation!",
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });

                  // Navigator.of(context).push(CupertinoPageRoute(
                  //     builder: (context) => bookingConfirmationPage()));
                }),
          )
        ],
      ),
    )));
  }
}

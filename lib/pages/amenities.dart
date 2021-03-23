import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AmenitiesPage extends StatefulWidget {
  @override
  _AmenitiesPageState createState() => _AmenitiesPageState();
}

class _AmenitiesPageState extends State<AmenitiesPage> {
  var light = false;
  var tv = false;
  var ac = false;
  var cafe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Center(child: Lottie.asset("assets/amenities.json", height: 230.0)),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Amenities",
              style: TextStyle(fontSize: 50.0, fontFamily: "homeAway"),
            ),
            SizedBox(height: 3.0),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    height: 415.0,
                    width: double.infinity,
                    child: Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.lightbulb_fill,
                              color: CupertinoColors.systemYellow,
                            ),
                            title: Text("Lights",
                                style: TextStyle(fontSize: 30.0)),
                            subtitle: Text("-Make room bright"),
                            trailing: CupertinoSwitch(
                                value: light,
                                onChanged: (bool value) {
                                  setState(() {
                                    light = value;
                                  });
                                }),
                          ),
                          SizedBox(height: 10.0),
                          ListTile(
                            leading: Icon(
                              Icons.ac_unit,
                              color: CupertinoColors.systemBlue,
                            ),
                            title:
                                Text("A/C", style: TextStyle(fontSize: 30.0)),
                            subtitle: Text("-Keep it cool"),
                            trailing: CupertinoSwitch(
                                value: ac,
                                onChanged: (bool value) {
                                  setState(() {
                                    ac = value;
                                  });
                                }),
                          ),
                          SizedBox(height: 10.0),
                          ListTile(
                            leading: Icon(
                              Icons.local_cafe_outlined,
                              color: CupertinoColors.systemGrey,
                            ),
                            title: Text("Coffee-Maker",
                                style: TextStyle(fontSize: 30.0)),
                            subtitle: Text("-Make some Cafe"),
                            trailing: CupertinoSwitch(
                                value: cafe,
                                onChanged: (bool value) {
                                  setState(() {
                                    cafe = value;
                                  });
                                }),
                          ),
                          SizedBox(height: 10.0),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.tv,
                              color: CupertinoColors.black,
                            ),
                            title: Text("TV", style: TextStyle(fontSize: 30.0)),
                            subtitle: Text("-Watch TV"),
                            trailing: CupertinoSwitch(
                                value: tv,
                                onChanged: (bool value) {
                                  setState(() {
                                    tv = value;
                                  });
                                }),
                          ),
                          SizedBox(height: 10.0),
                          CupertinoButton(
                            child: Text(
                              "Done",
                            ),
                            color: CupertinoColors.activeBlue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

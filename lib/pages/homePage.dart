import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotelmain/services/hotelService.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  var responseData;

  Future<List> hotelData;

  Future<List> getRequest() async {
    var response =
        await Dio().get("https://11f1812bfabd.ngrok.io/hotelRoute%22");

    return response.data;
  }

  // animation controller for lottie
  @override
  void initState() {
    // TODO: implement initState
    hotelData = getRequest();
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Hotels"),
            ),
          ];
        },
        body: Container(
          child: FutureBuilder<List>(
              future: hotelData,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 15.0),
                          child: Container(
                            height: 300.0,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 20.0,
                                child: Ink(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        gradient: LinearGradient(colors: [
                                          Colors.purple[800],
                                          Colors.blue[800]
                                        ])),
                                    child: Center(
                                      child: Text(
                                        snapshot.data[index]["hotelName"],
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white),
                                      ),
                                    ))),
                          ),
                        );
                      });
                }
                return Container(
                  child: Center(
                    child: SpinKitFoldingCube(
                      color: Colors.teal,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

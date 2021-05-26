import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotelmain/otherPages/aboutUs.dart';
import 'package:slimy_card/slimy_card.dart';

import 'package:hotelmain/pages/bookingInformation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  var responseData;
  Future<List> hotelData;
  int _selectedIndex = 0;

  Future<List> getRequest() async {
    var response = await Dio().get("http://52.66.53.243:3000/hotelroute");
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
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              stretch: true,
              largeTitle: Text("Hotels"),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: FutureBuilder<List>(
              future: hotelData,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(15.0),
                          child: SlimyCard(
                            slimeEnabled: true,
                            color: Colors.teal,
                            topCardHeight: 350,
                            width: 350,
                            bottomCardHeight: 150,
                            topCardWidget: topCardWidget(
                                "assets/cities.jpg",
                                snapshot.data[index]["hotelName"],
                                snapshot.data[index]["city"]),
                            bottomCardWidget: bottomCardWidget(),
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
      bottomNavigationBar: customBottomNavy(),
    );
  }

//top card widget for slimy card
  Widget topCardWidget(String imagePath, String hotelName, String location) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          hotelName,
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        SizedBox(height: 10),
        Text(
          location,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  //bottom card widget for slimy cards
  Widget bottomCardWidget() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          child: Text(
            "More Info",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {},
          color: Colors.white,
        ),
        SizedBox(
          height: 20.0,
        ),
        CupertinoButton(
          child: Text(
            "Book Room",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => bookingInformationPage()));
          },
          color: Colors.white,
        ),
      ],
    );
  }

  //bottom navigation bar item
  Widget customBottomNavy() {
    return BottomNavyBar(
      selectedIndex: _selectedIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
        if (_selectedIndex == 0) {
        } else if (_selectedIndex == 1) {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => AboutUs()));
        }
      },
      items: [
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('About Us'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Messages'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center),
      ],
    );
  }
}

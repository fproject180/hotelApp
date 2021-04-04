import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            enlargeCenterPage: true),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(0.0),
                  child: Card(
                elevation: 15.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ));
            },
          );
        }).toList(),
      ),
    );
  }
}

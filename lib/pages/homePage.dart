import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;

  // animation controller for lottie
  @override
  void initState() {
    // TODO: implement initState
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Lottie.asset('assets/cities_animation.json',
                controller: _animationController, onLoaded: (composition) {
              _animationController
                ..duration = composition.duration
                ..forward();
            }),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Cities",
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        "Pune",
                        style: TextStyle(fontSize: 40.0),
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      leading: Image(
                        image: AssetImage('assets/pune_city.png'),
                        height: 200.0,
                      ),
                      trailing: Icon(
                        CupertinoIcons.forward,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        "Mumbai",
                        style: TextStyle(fontSize: 40.0),
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      leading: Image(
                        image: AssetImage('assets/mumbai_city.png'),
                        height: 200.0,
                      ),
                      trailing: Icon(
                        CupertinoIcons.forward,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

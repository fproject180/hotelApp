import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmain/pages/amenities.dart';

class BookingInfoPage extends StatefulWidget {
  @override
  _BookingInfoPageState createState() => _BookingInfoPageState();
}

class _BookingInfoPageState extends State<BookingInfoPage> {
  var gender = 0;
  var minAge = 25;
  var checkInDate = DateTime.now();
  var checkOutDate = DateTime.now();
  List<int> ageLimit = [
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40
  ];

  final Map<int, Widget> genderOptions = const <int, Widget>{
    0: Text("Male"),
    1: Text("Female"),
    2: Text("Other"),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text("Booking Form"),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 20.0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  hintText: "Pankaj Tripathi",
                                  icon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "example@gmail.com",
                                  icon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Address",
                                  hintText: "Bavdhan pvpit",
                                  icon: Icon(Icons.add_road_sharp),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Divider(),
                            Text("Select Gender"),
                            CupertinoSlidingSegmentedControl(
                                groupValue: gender,
                                children: genderOptions,
                                onValueChanged: (index) => {
                                      setState(() {
                                        gender = index;
                                      })
                                    }),
                            Divider(),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                ElevatedButton(
                                    child: Text("Select Age"),
                                    onPressed: _selectAge),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Flexible(
                                    child: TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                      labelText: minAge.toString(),
                                      border: OutlineInputBorder()),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                ElevatedButton(
                                  child: Text("Check In Date"),
                                  onPressed: _selectCheckInDate,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                    child: TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                      labelText: checkInDate.toString(),
                                      border: OutlineInputBorder()),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.0,
                                ),
                                ElevatedButton(
                                  child: Text("Check Out Date"),
                                  onPressed: _selectCheckOutDate,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                    child: TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                      labelText: checkOutDate.toString(),
                                      border: OutlineInputBorder()),
                                ))
                              ],
                            ),
                            Divider(),
                            CupertinoButton(
                                child: Text("Submit"), onPressed: popUpDialog)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _selectAge() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() {
                  minAge = ageLimit[value];
                });
              },
              children: List.generate(ageLimit.length, (index) {
                return Text(ageLimit[index].toString());
              }),
            ),
          );
        });
  }

  void _selectCheckInDate() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            child: CupertinoDatePicker(
                initialDateTime: checkInDate,
                onDateTimeChanged: (value) {
                  setState(() {
                    checkInDate = value;
                  });
                }),
          );
        });
  }

  void _selectCheckOutDate() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            child: CupertinoDatePicker(
                initialDateTime: checkOutDate,
                onDateTimeChanged: (value) {
                  setState(() {
                    checkOutDate = value;
                  });
                }),
          );
        });
  }

  void popUpDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Please Read"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                      title: Text(
                          "Do not use the guest rooms for purposes other than intended without authorization"))
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AmenitiesPage()));
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }
}

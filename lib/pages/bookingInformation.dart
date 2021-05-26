import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelmain/pages/selectAppliance.dart';
import 'package:numberpicker/numberpicker.dart';

class bookingInformationPage extends StatefulWidget {
  @override
  _bookingInformationPageState createState() => _bookingInformationPageState();
}

class _bookingInformationPageState extends State<bookingInformationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController guestController = TextEditingController();
  TextEditingController checkinController = TextEditingController();
  TextEditingController checkoutController = TextEditingController();

  int currentStep = 0;
  DateTime dateTime = DateTime.now();
  int _value = 1;
  int _value1 = 1;
  int _value2 = 1;

  var _name;
  var _mobileno;
  var _city;
  var _room;
  var _guest;
  var _checkin;
  var _checkout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Information",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: CupertinoStepper(
          steps: _mySteps(),
          currentStep: this.currentStep,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < this._mySteps().length - 1) {
                //to go to next step
                currentStep = this.currentStep + 1;
              } else {
                //logic to check if everything is completed
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => selectAppliancePage()));
                print("Everything is complete");
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                this.currentStep = currentStep - 1;
              } else {
                this.currentStep = 0;
                print("we are at the top");
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          title: Text("Name"),
          content: CupertinoTextField(
            controller: nameController,
            placeholder: "John Doe",
            keyboardType: TextInputType.name,
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
            suffix: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 0),
      Step(
          title: Text("Mobile Number"),
          content: CupertinoTextField(
            controller: numberController,
            placeholder: "123456789",
            keyboardType: TextInputType.number,
            suffix: Icon(
              Icons.phone_iphone_sharp,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 1),
      Step(
          title: Text("City"),
          content: DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("Select City"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Pune"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Mumbai"), value: 3),
                DropdownMenuItem(child: Text("Banglore"), value: 4)
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
          isActive: currentStep >= 2),
      Step(
          title: Text("Room Type"),
          content: DropdownButton(
              value: _value1,
              items: [
                DropdownMenuItem(
                  child: Text("Select Room Type"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Standard"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Deluxe"), value: 3),
                DropdownMenuItem(child: Text("Presidential Suite"), value: 4)
              ],
              onChanged: (value) {
                setState(() {
                  _value1 = value;
                });
              }),
          isActive: currentStep >= 3),
      Step(
          title: Text("Number of Guests"),
          content: DropdownButton(
              value: _value2,
              items: [
                DropdownMenuItem(
                  child: Text("Select Number of Guests"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("1"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("2"), value: 3),
                DropdownMenuItem(child: Text("3"), value: 4),
                DropdownMenuItem(child: Text("4"), value: 5)
              ],
              onChanged: (value) {
                setState(() {
                  _value2 = value;
                });
              }),
          isActive: currentStep >= 4),
      Step(
          title: Text("Check-In Date"),
          content: CupertinoTextField(
            readOnly: true,
            placeholder:
                dateTime == DateTime.now() ? "Date of Birth" : "$dateTime",
            suffix: IconButton(
              icon: Icon(Icons.date_range),
              color: Colors.blue,
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2022))
                    .then((value) => setState(() {
                          dateTime = value;
                        }));
              },
            ),
          ),
          isActive: currentStep >= 5),
      Step(
          title: Text("Check-Out Date"),
          content: CupertinoTextField(
            readOnly: true,
            placeholder:
                dateTime == DateTime.now() ? "Date of Birth" : "$dateTime",
            suffix: IconButton(
              icon: Icon(Icons.date_range),
              color: Colors.blue,
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2022))
                    .then((value) => setState(() {
                          dateTime = value;
                        }));
              },
            ),
          ),
          isActive: currentStep >= 6),
    ];
    return _steps;
  }
}

import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelmain/pages/homePage.dart';
import 'package:hotelmain/services/registerService.dart';
import "package:lottie/lottie.dart";

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

Future<RegisterUser> registerWithNameEmailAndPassword(
    Name, Email, Password, MobileNo, Address, Dob) async {
  final String apiUrl = "http://52.66.53.243:3000/auth/register";
  Response response = await Dio().post(apiUrl, data: {
    "name": Name,
    "email": Email,
    "password": Password,
    "mobileNo": MobileNo,
    "address": Address,
    "dob": Dob
  });
  if (response.statusCode == 200) {
    final String responseString = response.data;
    return registerUserFromJson(responseString);
  } else {
    return null;
  }
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  int currentStep = 0;
  DateTime dateTime = DateTime.now();
  var formattedDate;

  RegisterUser _registerUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/register.json")),
          SizedBox(
            height: 50,
          ),
          Text(
            "REGISTER",
            style: TextStyle(fontFamily: "homeAway", fontSize: 50),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                        //logic to check if everything is completed
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
            ),
          ),
        ],
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
            suffix: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 0),
      Step(
          title: Text("Email"),
          content: CupertinoTextField(
            controller: emailController,
            placeholder: "example@example.com",
            suffix: Icon(
              Icons.mail,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 1),
      Step(
          title: Text("Password"),
          content: CupertinoTextField(
            obscureText: true,
            controller: passwordController,
            placeholder: "8 charaters long",
            suffix: Icon(
              Icons.lock,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 2),
      Step(
          title: Text("Mobile Number"),
          content: CupertinoTextField(
            controller: numberController,
            placeholder: "123456789",
            suffix: Icon(
              Icons.phone_iphone_sharp,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 3),
      Step(
          title: Text("Address"),
          content: CupertinoTextField(
            placeholder: "Address",
            controller: addressController,
            suffix: Icon(
              Icons.add_road_outlined,
              color: Colors.blue,
            ),
          ),
          isActive: currentStep >= 4),
      Step(
          title: Text("Date Of Birth"),
          content: CupertinoTextField(
            readOnly: true,
            controller: dobController,
            placeholder:
                formattedDate == null ? "Date of Birth" : "$formattedDate",
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
                          formattedDate = value;
                        }));
              },
            ),
          ),
          isActive: currentStep >= 5),
    ];
    return _steps;
  }
}

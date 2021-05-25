// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  RegisterUser({
    this.name,
    this.email,
    this.password,
    this.mobileNo,
    this.address,
    this.dob,
  });

  String name;
  String email;
  String password;
  int mobileNo;
  String address;
  String dob;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        mobileNo: json["mobileNo"],
        address: json["address"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "mobileNo": mobileNo,
        "address": address,
        "dob": dob,
      };
}

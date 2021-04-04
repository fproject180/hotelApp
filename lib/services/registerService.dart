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
    this.MobileNo,
  });

  String name;
  String email;
  String password;
  String MobileNo;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        MobileNo: json["MobileNo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "MobileNo": MobileNo
      };
}

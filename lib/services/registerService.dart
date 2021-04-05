// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  RegisterUser({
    this.Name,
    this.Email,
    this.Password,
    this.MobileNo,
  });

  String Name;
  String Email;
  String Password;
  String MobileNo;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        Name: json["Name"],
        Email: json["Email"],
        Password: json["Password"],
        MobileNo: json["MobileNo"],
      );

  Map<String, dynamic> toJson() => {
        "Name": Name,
        "Email": Email,
        "Password": Password,
        "MobileNo": MobileNo
      };
}

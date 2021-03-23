// To parse this JSON data, do
//
//     final amenitiesToggle = amenitiesToggleFromJson(jsonString);

import 'dart:convert';

AmenitiesToggle amenitiesToggleFromJson(String str) =>
    AmenitiesToggle.fromJson(json.decode(str));

String amenitiesToggleToJson(AmenitiesToggle data) =>
    json.encode(data.toJson());

class AmenitiesToggle {
  AmenitiesToggle({
    this.amenitiesName,
    this.flag,
  });

  String amenitiesName;
  int flag;

  factory AmenitiesToggle.fromJson(Map<String, dynamic> json) =>
      AmenitiesToggle(
        amenitiesName: json["amenitiesName"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "amenitiesName": amenitiesName,
        "flag": flag,
      };
}

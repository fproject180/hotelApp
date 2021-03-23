// To parse this JSON data, do
//
//     final amenititesService = amenititesServiceFromJson(jsonString);

import 'dart:convert';

AmenititesService amenititesServiceFromJson(String str) =>
    AmenititesService.fromJson(json.decode(str));

String amenititesServiceToJson(AmenititesService data) =>
    json.encode(data.toJson());

class AmenititesService {
  AmenititesService({
    this.amenities,
    this.flag,
  });

  String amenities;
  String flag;

  factory AmenititesService.fromJson(Map<String, dynamic> json) =>
      AmenititesService(
        amenities: json["amenities"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "amenities": amenities,
        "flag": flag,
      };
}

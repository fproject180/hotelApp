// To parse this JSON data, do
//
//     final hotelService = hotelServiceFromJson(jsonString);

import 'dart:convert';

HotelService hotelServiceFromJson(String str) =>
    HotelService.fromJson(json.decode(str));

String hotelServiceToJson(HotelService data) => json.encode(data.toJson());

class HotelService {
  HotelService({
    this.hotelId,
    this.hotelName,
    this.city,
  });

  String hotelId;
  String hotelName;
  String city;

  factory HotelService.fromJson(Map<String, dynamic> json) => HotelService(
        hotelId: json["hotelId"],
        hotelName: json["hotelName"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "hotelName": hotelName,
        "city": city,
      };
}

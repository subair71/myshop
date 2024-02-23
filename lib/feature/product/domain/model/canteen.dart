// To parse this JSON data, do
//
//     final canteen = canteenFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'canteen.g.dart';

Canteen canteenFromJson(String str) => Canteen.fromJson(json.decode(str));

String canteenToJson(Canteen data) => json.encode(data.toJson());

@HiveType(typeId: 6)
class Canteen {
  Canteen({
    required this.status,
    required this.canteen,
  });

  @HiveField(0)
  String status;
  @HiveField(1)
  List<ProductElement> canteen;

  factory Canteen.fromJson(Map<String, dynamic> json) => Canteen(
        status: json["status"],
        canteen: List<ProductElement>.from(
            json["CANTEEN"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "CANTEEN": List<dynamic>.from(canteen.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 7)
class ProductElement {
  ProductElement({
    required this.locId,
    required this.locationName,
    // required this.catName,
    required this.locationUrl,
    required this.latitude,
    required this.longitude
  });

  @HiveField(0)
  String locId;
  @HiveField(1)
  String locationName;
  // @HiveField(2)
  // String catName;
  @HiveField(3)
  String locationUrl;
  @HiveField(4)
  String latitude;
  @HiveField(5)
  String longitude;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        locId: json["loc_id"],
        locationName: json["location_name"],
        // catName: json["cat_name"],
        locationUrl: json["location_url"],latitude: json["latitude"],longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "loc_id": locId,
        "location_name": locationName,
        // "cat_name": catName,
        "location_url": locationUrl, "latitude": latitude, "longitude": longitude,
      };
}

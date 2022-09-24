import 'package:flutter/material.dart';

class Place {
  
  final String name;
  final double latitude;
  final double longitude;
  final String placeId;
  final String photoUrl;

  Place(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.placeId,
      required this.photoUrl});

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json["geometry"]["location"];

    Iterable? photos = json["photos"];

    return Place(
        name: json["name"],
        latitude: location["lat"],
        longitude: location["lng"],
        placeId: json["place_id"],

         photoUrl: photos == null
         ? "images/1.jpg"
         : photos.first["photo_reference"].toString()
       // photoUrl: "images/1.jpg"

        );
    // photoUrl: photos == null
    //     ? "images/1.jpg"
    //     : photos.first["photo_reference"].toString());

    // photoUrl: (json["photos"][0])["photo_reference"]);
  }
}

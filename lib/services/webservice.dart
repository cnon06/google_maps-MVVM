import 'dart:convert';

import 'package:google_maps/models/place.dart';
import 'package:google_maps/utils/urlhelper.dart';
import 'package:http/http.dart' as httpByCnonSoftware;

class WebService {
  Future<List<Place>> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final url =
        UrlHelper.urlForPlaceKeywordAndLocation(keyword, latitude, longitude);
    final response = await httpByCnonSoftware.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse["results"];
      return results.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception("Unable to perform request.");
    }
  }
}

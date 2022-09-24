import 'package:flutter/foundation.dart';
import 'package:google_maps/services/webservice.dart';
import 'package:google_maps/viewmodels/placeViewModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//late List<PlaceViewModel> results2  =[];

class PlaceListViewModel extends ChangeNotifier {
  List<PlaceViewModel> places = [];

  var mapType = MapType.normal;

  void toggleMapType() {
    mapType = mapType == MapType.normal ? MapType.satellite : MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final results = await WebService()
        .fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);

    places = results.map((place) => PlaceViewModel(place)).toList();
    //  results2 = places;
    notifyListeners();
  }
}

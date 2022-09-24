import 'package:google_maps/models/place.dart';

class PlaceViewModel {
  late Place _place;

  PlaceViewModel(Place place) {
    _place = place;
  }

  String get placeId {
    return _place.placeId;
  }


  String get photoUrl {
    return _place.photoUrl;
  }

  String get name {
    return _place.name;
  }


  double get latitude {
    return _place.latitude;
  }


  double get longitude {
    return _place.longitude;
  }
 
}

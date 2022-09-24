import 'package:google_maps/utils/constants.dart';

class UrlHelper {


 static String urlForReferenceImage(String photoReferenceId) {
   return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=$API_KEY";
   // return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=AIzaSyCZDOuOGGn-6FmHZpkVsRE7po1F__93qWU";
  }

  static String urlForPlaceKeywordAndLocation(
      String keyword, double latitude, double longitude) {

   return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$latitude%2C$longitude&radius=1500&type=restaurant&key=$API_KEY";

//  return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$latitude%2C$longitude&radius=1500&type=restaurant&key=AIzaSyCZDOuOGGn-6FmHZpkVsRE7po1F__93qWU";
   
  }
}

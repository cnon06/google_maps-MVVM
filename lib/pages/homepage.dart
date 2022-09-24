import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps/pages/example.dart';
import 'package:google_maps/viewmodels/placeListViewModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as prefix0;
import 'package:provider/provider.dart';

import '../utils/determineposition.dart';
import '../viewmodels/placeViewModel.dart';
import '../widgets/placelist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  late Position _currentPosition;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    _currentPosition = await determinePosition();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        zoom: 12)));
  }

  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places) {
    return places.map((place) {
      return Marker(
          markerId: MarkerId(place.placeId),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: place.name),
          position: LatLng(place.latitude, place.longitude));
    }).toSet();
  }

 Future <void> _openMapsFor(PlaceViewModel vm)   async {



if (await prefix0.MapLauncher.isMapAvailable(prefix0.MapType.google) != null ) {

                                              await prefix0.MapLauncher.showMarker(
                                                  mapType: prefix0.MapType.google,
                                                  coords: prefix0.Coords(vm.latitude, vm.longitude),
                                                  title: vm.name,
                                                  description: vm.name,
                                                );
                                      }
  //  print('nhlmömm');

   // Navigator.push(context, MaterialPageRoute(builder: (context) => Examp()));
    // return 5;
    //print("maps work");
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlaceListViewModel>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Place Finder"),
      // ),

      body: Stack(
        children: [
          GoogleMap(
            mapType: vm.mapType,
            markers: _getPlaceMarkers(vm.places),
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(38.423733, 27.142826),
              zoom: 12,
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                //print("VALUE: $value");
                vm.fetchPlacesByKeywordAndPosition(value,
                    _currentPosition.latitude, _currentPosition.longitude);

                // print("RESULTS2: ${results2.length}");
                // print("FETCH: ${vm.fetchPlacesByKeywordAndPosition(keyword, latitude, longitude)}");
              },
              decoration: const InputDecoration(
                labelText: "Search here.",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          )),

          Visibility(
            visible: vm.places.isNotEmpty ? true : false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => PlaceList(
                                places: vm.places,
                                onSelected: _openMapsFor,
                              ));
                    },
                    child: const Text("Show List")),
              ),
            ),
          ),

          Positioned(
            top: 250,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                vm.toggleMapType();
              },
              child: Icon(Icons.map),
            ),
          )

          // Image.asset("images/placeholder.webp"),
        ],
      ),
    );
  }
}

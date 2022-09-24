import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/utils/urlhelper.dart';
import 'package:google_maps/viewmodels/placeViewModel.dart';

class PlaceList extends StatelessWidget {
  final List<PlaceViewModel> places;

  final ValueSetter <PlaceViewModel> onSelected;

  // final VoidCallback (PlaceViewModel) onSelected = (){};

  PlaceList({Key? key, required this.places, required this.onSelected})
      : super(key: key);

  //VoidCallback myVoidCallback = () {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];

          return ListTile(
            onTap: () {
              //print("rgtyhjhjkş");
              onSelected(places[index]);
              // myVoidCallback();
              //  this.onSelected(place);
            },
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Image.network(UrlHelper.urlForReferenceImage(place.photoUrl),
                      width: 70,
                      errorBuilder: (context, url, error) => Container(
                            width: 70,
                            child: const Center(child: Icon(Icons.error)),
                          )),
            ),
            title: Text("${place.name}"),
          );
        });
  }
}

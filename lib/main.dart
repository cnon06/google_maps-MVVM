

import 'package:flutter/material.dart';

import 'package:google_maps/pages/homepage.dart';

import 'package:google_maps/viewmodels/placeListViewModel.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: 
      ChangeNotifierProvider(
        create: (context) => PlaceListViewModel(),
        child: const MyHomePage(),
      )
      //  MyHomePage(),
    );
  }
}


import 'package:demomap/getlocation.dart';
import 'package:demomap/place_picker.dart';
import 'package:demomap/web_socket.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreenApp(),
    );
  }
}

class MainScreenApp extends StatelessWidget {
  const MainScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      ListShow(
        title: "Place Picker by 'PlacePickermd'",
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PickPlaceByPlacePickerPack()),
          );
        },
      ),
      ListShow(
        title: "Get Location Custom",
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const GetLocation()),
          );
        },
      ),
      ListShow(
        title: "Web Socket",
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WebSocketApp()),
          );
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Google Map Features Demo"),),
      body: SafeArea(
        child: ListView.builder(
          itemCount: list.length,
            itemBuilder: (context, index){
          return list[index];
        }),
      ),
    );
  }
}

class ListShow extends StatelessWidget {
  final String title;
  final Function onTap;
  const ListShow({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: Offset(0, 3)
            )
          ],
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(18, 15, 18, 0),
        child: Center(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
      ),
    );
  }
}





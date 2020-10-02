import 'package:MeetingsManager/homepage.dart';
import "package:flutter/material.dart";

const Color myColor = Colors.pink; //will need to import main.dart if used
void main() {
  runApp(MyApp());
  //runApp is a fn that calls class MyApp
}

//Class called by MyApp is root of the project. It is the outermost
//part of the app i.e. the app itself which will have a fixed state.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context keeps track of each widget

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      theme: ThemeData(
        primarySwatch: myColor,
        fontFamily: "Walkway",
      ),
      home: HomePage(),
    );
  }
}

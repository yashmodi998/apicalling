import 'package:api_calling/chooseLocation.dart';
import 'package:api_calling/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:api_calling/FirstScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
theme: ThemeData.dark(),
      initialRoute: SecondScreen.id,
      routes: {
        FirstScreen.id:(context)=>FirstScreen(),
        SecondScreen.id:(context)=>SecondScreen(),
        ChooseLocation.id:(context)=>ChooseLocation(),
      },
    );
  }
}

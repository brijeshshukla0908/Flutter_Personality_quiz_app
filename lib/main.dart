import 'package:flutter/material.dart';
import 'package:peronality_quiz/splash.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
       title : "Persona Quiz",
       theme: ThemeData(
         primarySwatch : Colors.blue,
         brightness: Brightness.light,
       ),
       home: splashscreen(),
    );
  }
}
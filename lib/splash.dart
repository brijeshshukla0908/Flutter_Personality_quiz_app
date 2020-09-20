
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:peronality_quiz/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
         fit: StackFit.expand,
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
               color: Colors.deepPurpleAccent,
               gradient:  LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                 colors: [
                   Colors.blue[700],
                  Colors.deepPurpleAccent[700],

                  ]   
                 ),
                ),
                
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 75.0,
                      child: Icon(
                        Icons.filter_vintage,
                        color: Colors.blueGrey[700],
                        size: 80.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Welcome To PersonaQuiz",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                    ),
                  ],)
         ],
       ),
    );
  }
}
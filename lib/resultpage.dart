import 'package:flutter/material.dart';
import 'package:peronality_quiz/home.dart';
import 'package:peronality_quiz/custom_result_app_bar.dart';
import 'dart:io';
class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key , @required this.marks}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {

  List<String> images = [
    "images/success.jpg",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;
  @override
  void initState(){
   
  

    if(marks > 0){
      image = images[2];
      message = "A";
    }else if(marks == 0){
      image = images[1];
      message = "C";
    }else{
      image = images[0];
      message = "B";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: CustomResultAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              child: Container(
              color: Colors.lightBlue[100],
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 270.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Quando",
                        ),
                         textAlign: TextAlign.center,
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  RaisedButton(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                          ),
                         ),
                            highlightElevation: 30,
                            onPressed: () {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => homepage(),
                    ));
                  },
                    color: Colors.deepPurpleAccent[700],
                                elevation: 40,
                                 child: Container(
                                   width: 150,
                                   height: 60,
                                   child: Center(
                                     child: Text(
                                  "Continue", 
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  ),),
                                   ),
                                 ),
                                 ),
                               SizedBox(height: 30),
                               RaisedButton(
            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                          ),
                       ),
                       highlightElevation: 30,
              child: Container(
                 width: 150,
                height: 60,
                child: Center(
                  child: Text(
                  "Exit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24
                  ),
                  ),
                ),
              ),
            onPressed: () => exit(0),
            color: Colors.deepPurpleAccent[700],
                               elevation: 40,
                               ),
                
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

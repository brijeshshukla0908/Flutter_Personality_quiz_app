import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            
            Colors.blue[900],
            Colors.deepPurpleAccent[700],
            ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Text(
              'Persona Quiz',
                style: TextStyle(
                fontSize: 24,
                fontFamily: "Quando", 
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
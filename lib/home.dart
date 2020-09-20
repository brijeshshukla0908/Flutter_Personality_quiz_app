import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peronality_quiz/quizpage.dart';
import 'package:peronality_quiz/custom_app_bar.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/intro.png",
    "images/creat.png",
    "images/casual.png",
  ];

  List<String> des = [
    "Here we have three types of Personalities namely Extrovert, Introvert and Ambivert.\n 'A' - Grade for Introvert \n 'B' - Grade for Extrovert \n 'C' - Grade for Introvert",
    "In this type there are two types of Personalities, named as Creative and Logical.\n 'A' - Grade for Creative \n 'B' - Grade for Logical \n 'C' - Grade for Both",
    "In this type there are two types of Personalities, named as Casual and Ambitious\n 'A' - Grade for Casual \n 'B' - Grade for Ambitious \n 'C' - Grade for Both",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(langname),
            
          ));
        },
        child: Material(
          color: Colors.deepPurpleAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(28.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Alike",
                      fontWeight: FontWeight.w500

                    ),
                
                    textAlign: TextAlign.center,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color.fromARGB(255, 29, 15, 101),
      body: ListView(
        children: <Widget>[
          Material(
          color: Color.fromARGB(255, 29, 15, 101),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "images/person.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Hello Curious Minds!",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "We love you a lot and in this world full of people, we are all striving to stand\n out from the crowd. The first step toward which is finding ourselves.\n So we introduce you to all new fun personality analysis quiz \n where the personalities are being classified into three different catgories as shown below.\n Arey you ready to answer a few questions about yourself?",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 9,
                    textAlign: TextAlign.center,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
          customcard("Introvert - Extrovert", images[0], des[0]),
          customcard("Creative - Logical", images[1], des[1]),
          customcard("Casual - Ambicious", images[2], des[2]),
          
        ],
      ),

    );
  }
}
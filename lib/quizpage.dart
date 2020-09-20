import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peronality_quiz/resultpage.dart';

class getjson extends StatelessWidget {
  
  String langname;
  getjson(this.langname);
  String assettoload;
  

  setasset() {
    if (langname == "Introvert - Extrovert") {
      assettoload = "assets/introvert.json";
    } else if (langname == "Creative - Logical") {
      assettoload = "assets/creative.json";
    } else {
      assettoload = "assets/casual.json";
   }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  final List mydata;


  quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  final List mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  int marks = 0;
  int i = 1;
  
  bool disableAnswer = false;

  
  
  int j = 1;
  
  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.blue[700],
    "b": Colors.blue[900],
    
  };

  bool canceltimer = false;

  genrandomarray(){
    var distinctIds = [];
    var rand = new Random();
      for (int i = 0; ;) {
      distinctIds.add(rand.nextInt(10)+1);
        random_array = distinctIds.toSet().toList();
        if(random_array.length < 10){
          continue;
        }else{
          break;
        }
      }
      print(random_array);
  }

  @override
  void initState() {
    genrandomarray();
    super.initState();
  }

  
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  
  void nextquestion() {
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.blue[700];
      btncolor["b"] = Colors.blue[900];
      disableAnswer = false;
    });
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 1;
    } else {
      marks = marks - 1;
    
    }
    
    setState(() {
      
      btncolor[k] = colortoshow;
      
    });
    nextquestion();
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 20.0,
            fontWeight: FontWeight.w900
          ),
          maxLines: 1,
        ),
        
        color: btncolor[k],
        splashColor: Colors.cyanAccent,
        highlightColor: Colors.purpleAccent,
        minWidth: 250.0,
        height: 50.0,
        shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                        ),
                      ),
                      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quizstar",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 29, 15, 101),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quando",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: AbsorbPointer(
                  absorbing: disableAnswer,
                    child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choicebutton('a'),
                        choicebutton('b'),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
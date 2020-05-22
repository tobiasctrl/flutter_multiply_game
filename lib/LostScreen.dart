import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admob_service.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'save_scores.dart';

import 'dart:io';
import 'main.dart';

class Failed extends StatefulWidget {
  int score;
  int maxresult;
  Failed(this.score, this.maxresult);
  FailedRoute createState() => FailedRoute(this.score, this.maxresult);
}

class FailedRoute extends State {
  int score;
  bool _wait = false;
  int maxresult;
  FailedRoute(this.score, this.maxresult);
  static int i = 0;
  int _adshow;
  
  final ams = AdMobService();
  int _highscore;
  Random _random = Random();

  // FailedRoute(this._timeElapsed);
  @mustCallSuper
  void initState() {
    addIntToSF(maxresult, score);
    // getIntValuesSF(maxresult.toString());
    
    // _highscore =
    print(this.score);
    _adshow = _random.nextInt(5);
    if (_adshow == 1) {
      print('ad');
    }
  }

  // Future<void> getIntValuesSF(String intIndex) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return int
  //   int intValue = prefs.getInt(intIndex);
  //   setState(() {
  //     _highscore = intValue;
  //   });
  // }

  addIntToSF(int levelValue, int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currnetHighScore = prefs.getInt(levelValue.toString()) ?? 0;
    if (currnetHighScore < score) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(levelValue.toString(), score);
      setState(() {
      _highscore = score;
    });
    }
    else{
      setState(() {
      _highscore = currnetHighScore;
    });
    }
  }

  Widget build(BuildContext context) {
    if (_adshow == 1) {
      InterstitialAd retryad = ams.getLostInterstitial();
      retryad.load();
      retryad.show();
      setState(() {
        _adshow = 2;
        _wait = true;

      });
    }

    return MaterialApp(
      home: Scaffold(
          body: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.orangeAccent,
            Colors.yellow,
            Colors.orangeAccent
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Highscore:",
                          style: TextStyle(fontSize: 30, color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          _highscore.toString(),
                          style: TextStyle(fontSize: 60, color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Score:",
                      style: TextStyle(fontSize: 50, color: Colors.black54),
                    ),
                    Text(
                      (this.score).toString(),
                      style: TextStyle(fontSize: 200, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, 0.9),
                child: ClipOval(
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.blue,
                          offset: Offset(20.0, 10.0),
                          blurRadius: 102.0,
                          spreadRadius: 40.0)
                    ]),
                    child: InkWell(
                      child: Icon(
                        Icons.refresh,
                        size: 40,
                      ),
                      onTap: () {
                        if (_wait == true) {
                          Timer(Duration(seconds: 3), () {
                            Navigator.pop(context);
                            print("retry");
                          });
                        } else {
                          Navigator.pop(context);
                          print("retry");
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

import 'dart:math';
// import 'package:admob_flutter/admob_flutter.dart';

// import 'package:in_app_purchase/in_app_purchase.dart';

import 'levelselction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'logic.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:admob_flutter/admob_flutter.dart';
import 'admob_service.dart';
import 'package:multiply/LostScreen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      home: HomeRoute(),
    ));
  });
}

class GameRoute extends StatelessWidget {
  int maxresult;
  GameRoute(this.maxresult);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.orangeAccent,
            Colors.yellow,
            Colors.orangeAccent
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: UpdateText(this.maxresult),
        ),
      ),
    );
  }
}

class UpdateText extends StatefulWidget {
  int maxresult;
  UpdateText(this.maxresult);
  UpdateTextState createState() => UpdateTextState(this.maxresult);
}

class UpdateTextState extends State {
  int maxresult;
  final ams = AdMobService();
  UpdateTextState(this.maxresult);
  static var equationtrue = Random().nextInt(2);
  static var maxval = 20;
  String textHolder = gettext(equationtrue, maxval);
  var pVal = 100;
  int animdur = 0;
  int _duration = 30000;
  bool _exit = false;
  int _score = 0;
  int _maxscore = 0;
  // Stopwatch sw = Stopwatch();
  @mustCallSuper
  void initState() {
    print("init");
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  resetScore() {
    setState(() {
      _maxscore = _score;
      _score = 0;
      _duration = 30000;
      if (maxresult == 0) {
        maxval = 20;
      } else {
        maxval = maxresult;
      }
    });
  }

  addScore() {
    setState(() {
      _score += 1;
      if (this.maxresult == 0) {
        maxval += 2;
      } else {
        maxval = this.maxresult;
      }
    });
  }

  resetProgress() {
    setState(() {
      if (_duration > 10000) {
        _duration -= 500;
      }
      pVal = 101;
      _exit = true;
    });
  }

  changeProgress() {
    Timer(Duration(milliseconds: 50), () {
      _exit = false;
      Timer.periodic(Duration(microseconds: _duration), (time) {
        if (mounted) {
          setState(() {
            if (_exit == true) {
              time.cancel();
            }
            if (pVal > 0) {
              pVal -= 1;
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Failed(_maxscore, this.maxresult)),
              );
              resetScore();
              resetProgress();
              time.cancel();
            }
          });
        }
      });
    });
  }

  changeText() {
    setState(() {
      equationtrue = Random().nextInt(2);
      textHolder = gettext(equationtrue, maxval);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Center(
            child: new Text(textHolder.padLeft(2),
                textScaleFactor: 4, style: TextStyle(color: Colors.white70)),
          ),
        ),
        Expanded(
            child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.1,
                    child: FAProgressBar(
                      maxValue: 100,
                      currentValue: pVal,
                      animatedDuration: Duration(milliseconds: animdur),
                    )))),
        Expanded(
          child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                _score.toString(),
                textScaleFactor: 10,
                style: TextStyle(color: Colors.black38),
              )),
        ),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: new SizedBox(
                    width: 170,
                    height: 170,
                    child: OutlineButton(
                      onPressed: () {
                        //changeProgress();
                        if (equationtrue == 1) {
                          changeText();
                          resetProgress();
                          changeProgress();
                          addScore();
                          //print("right");
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Failed(_maxscore, this.maxresult)),
                          );
                          resetScore();
                          resetProgress();

                          //print("wrong");
                        }
                      },
                      highlightColor: Colors.white54,
                      splashColor: Colors.transparent,
                      highlightedBorderColor: Colors.white54,
                      color: Colors.orangeAccent,
                      child: Center(
                        child: Icon(
                          Icons.done,
                          color: Colors.orange,
                          size: 75.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                          color: Colors.orange,
                          style: BorderStyle.solid,
                          width: 10.0),
                    )),
              ),
            ),
            Expanded(
              child: Center(
                child: new SizedBox(
                    width: 170,
                    height: 170,
                    child: OutlineButton(
                      onPressed: () {
                        //changeProgress();
                        if (equationtrue == 0) {
                          changeText();
                          resetProgress();
                          changeProgress();
                          addScore();
                          //print("right");
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Failed(_maxscore, this.maxresult)),
                          );
                          resetScore();
                          resetProgress();

                          //print("wrong");
                        }
                      },
                      highlightColor: Colors.white54,
                      splashColor: Colors.transparent,
                      highlightedBorderColor: Colors.white54,
                      color: Colors.orangeAccent,
                      child: Center(
                        child: Icon(
                          Icons.cancel,
                          color: Colors.orange,
                          size: 75.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                          color: Colors.orange,
                          style: BorderStyle.solid,
                          width: 10.0),
                    )),
              ),
            ),
          ],
        )),
        // AdmobBanner(adUnitId: ams.getBannerAdId(), adSize: AdmobBannerSize.FULL_BANNER,
        // ),
      ],
    );
  }
}
class HomeRoute extends StatefulWidget{

  HomeRouteState createState() => HomeRouteState();
}

class HomeRouteState extends State {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   backgroundColor: Colors.orange,
      //   child: Center(
      //     child: Stack(
      //       children: <Widget>[
      //         Center(
      //           child: Icon(
      //             Icons.block,
      //             size: 50,
      //           ),
      //         ),
      //         Center(
      //             child: Text(
      //           "AD",
      //           style: TextStyle(fontSize: 20),
      //         )),
      //       ],
      //     ),
      //   ),
      // ),
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
          child: Align(
            alignment: Alignment(0, -1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                // Align(
                //   alignment: Alignment(0.8, 0.9),
                //   child: ClipOval(
                //     child: Stack(
                //       children: <Widget>[
                //         RawMaterialButton(
                //           onPressed: () {},
                //           constraints: BoxConstraints(),
                //           elevation: 5.0,
                //           fillColor: Colors.orange,
                //           child: Icon(
                //             Icons.trending_up,
                //             size: 20.0,
                //           ),
                //           padding: EdgeInsets.all(10.0),
                //           shape: CircleBorder(),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 200,
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      disabledColor: Colors.greenAccent,
                      splashColor: Colors.transparent,
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameRoute(0)),
                        );
                      },
                      child: Text("Endless Mode",
                          style: GoogleFonts.raleway(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              color: Colors.white))),
                ),
                SizedBox(
                  height: 10,
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Container(
                    color: Colors.transparent,
                    height: 300,
                    child: LSelection(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

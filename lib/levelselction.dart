import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class LSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 130,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameRoute(50)),
                    );
                  },
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      "  Very easy\n von 1 bis 50",
                      style: GoogleFonts.redHatText(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 130,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameRoute(100)),
                    );
                  },
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      "       easy\n von 1 bis 100",
                      style: GoogleFonts.redHatText(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 130,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameRoute(130)),
                    );
                  },
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      "    medium\n von 1 bis 130",
                      style: GoogleFonts.redHatText(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 130,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameRoute(160)),
                    );
                  },
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      "       hard\n von 1 bis 160",
                      style: GoogleFonts.redHatText(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 130,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameRoute(220)),
                );
              },
              color: Colors.orangeAccent,
              child: Center(
                child: Text(
                  "   very hard\n von 1 bis 220",
                  style: GoogleFonts.redHatText(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

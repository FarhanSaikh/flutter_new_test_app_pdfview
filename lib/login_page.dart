import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MainUI extends StatefulWidget {
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SourceSansProRegular'),

      home: Scaffold(

        backgroundColor: Colors.blueAccent[100],
        body:
        ListView(
          shrinkWrap: false,

          scrollDirection: Axis.vertical,
          children: <Widget>[

            Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: <Widget>[
                getImage(),
                buildText(),
                buildMainLoginUI(),
              ],
            ),
          ],
        ),

      ),
    );
  }





  Widget buildMainLoginUI() {
    return Padding(

      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,


        children: <Widget>[

          SizedBox(
            height: 50,
          ),

          buildFbLoginUI(),
          buildGLoginUI(),
          buildAnonymLoginUI()
        ],

      ),
    );

  }

  Container buildFbLoginUI() {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 10),
      child: ButtonTheme(
        height: 48,
        child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: () {
              //initiateSignIn("FB");
            },
            color: Color.fromRGBO(27, 76, 213, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            textColor: Colors.blueAccent[400],
            child: Text(
              "Login with Facebook",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )),
      ),
    );
  }

  Container buildAnonymLoginUI() {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 10),
      child: ButtonTheme(
        height: 48,
        child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: () {
              //initiateSignIn("FB");
            },
            color: Colors.black26,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            textColor: Colors.white,
            child: Text(
              "Login Anonymously ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )),
      ),
    );
  }
  Container buildGLoginUI() {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 10),
      child: ButtonTheme(
        height: 48,
        minWidth: 100,
        child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: () {
              //initiateSignIn("FB");
            },
            color: Colors.red[600],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            textColor: Colors.white,
            child: Text(
              "Login with Google",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )),
      ),
    );
  }

  Widget getImage() {
    return Padding(
      padding:EdgeInsets.only(left: 8,right: 8,top: 20,bottom: 20),
      child: Image.asset(
        'assets/images/loginjpeg.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Please login to save your scores ',
        style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black,
        ),
      ),
    );
  }
}

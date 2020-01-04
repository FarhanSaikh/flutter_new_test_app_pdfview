import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:backdrop/backdrop.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class mybackdrop extends StatefulWidget {
  @override
  _mybackdropState createState() => _mybackdropState();
}

class _mybackdropState extends State<mybackdrop> {
  String path;
  String textload = "pdf not loaded";
  bool load = false;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  Color selectedcolor = Colors.lightBlue[500];
  Color selectedtextcolor = Colors.white;






  @override
  initState() {
    super.initState();
    loadPdf();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/teste.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<Uint8List> fetchPost() async {
    final response = await http.get(
        'http://www.oecd.org/pisa/aboutpisa/PISA%20for%20Schools%20sample%20test%20items.pdf');
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  loadPdf() async {
    writeCounter(await fetchPost());
    path = (await _localFile).path;
    load = true;

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SourceSansProRegular'),
      home: Scaffold(
        body: BackdropScaffold(
          title: Text("PISA EXAM 2016"),
          backLayer: buildQuizPage(),
          frontLayer: Container(
            height: double.infinity,
            child: load
                ? PdfViewer(
                    filePath: path,
              onPdfViewerCreated: () {
                textload = 'Pdf loaded ';
                      setState(() {
                        load = true;
                      });
              },
            )
                : Center(
                    child: Text('Loading Question Paper...'),
                  ),
          ),
          iconPosition: BackdropIconPosition.action,
        ),
      ),
      title: 'hello',
    );
  }

  Widget buildQuizPage() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 5, right: 5, bottom: 20),
                child: Text(
                  'Question will be shown here if available',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            ButtonWidget1('Option 1', selected1),
            ButtonWidget2('Option 2', selected2),
            ButtonWidget3('Option 3', selected3),
            ButtonWidget4('Option 4', selected4),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ButtonWidget(' Previous ', false, Icons.skip_previous),
                  ButtonWidget(' Next ', false, Icons.skip_next),
                  ButtonWidget(' Submit ', false, Icons.check),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ButtonWidget1(String buttontext, bool select) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        onPressed: () {
          setState(() {
            if (selected1 == true) {
              this.selected1 = false;
            }
            else {
              selected1 = true;
              selected2 = false;
              selected3 = false;
              selected4 = false;
            }
          });
        },
        color: selected1 ? selectedcolor : Colors.white,
        textColor: Colors.black,
        hoverElevation: 6000,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Text(buttontext, style: TextStyle(
            fontSize: 14, color: selected1 ? selectedtextcolor : Colors.black)),
      ),
    );
  }

  Widget ButtonWidget(String buttontext, bool select, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        onPressed: () {
          setState(() {


          });
        },
        color: selectedcolor,
        textColor: Colors.black,
        hoverElevation: 6000,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(iconData, color: Colors.white,),
            Text(buttontext, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,

                color: Colors.white
            ), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

  Widget ButtonWidget2(String buttontext, bool select) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        onPressed: () {
          setState(() {
            if (selected2 == true) {
              selected2 = false;
            }
            else {
              selected2 = true;
              selected1 = false;
              selected3 = false;
              selected4 = false;
            }
          });
        },
        color: selected2 ? selectedcolor : Colors.white,
        textColor: Colors.black,
        hoverElevation: 6000,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(2.0),
        ),
        child: Text(buttontext, style: TextStyle(
            fontSize: 14, color: selected2 ? selectedtextcolor : Colors.black)),
      ),
    );
  }

  Widget ButtonWidget3(String buttontext, bool select) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        onPressed: () {
          setState(() {
            if (selected3 == true) {
              selected3 = false;
            }
            else {
              selected3 = true;
              selected2 = false;
              selected1 = false;
              selected4 = false;
            }
          });
        },
        color: selected3 ? selectedcolor : Colors.white,
        textColor: Colors.black,
        hoverElevation: 6000,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Text(buttontext, style: TextStyle(
            fontSize: 14, color: selected3 ? selectedtextcolor : Colors.black)),
      ),
    );
  }

  Widget ButtonWidget4(String buttontext, bool select) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        padding: EdgeInsets.all(12.0),
        onPressed: () {
          setState(() {
            if (selected4 == true) {
              selected4 = false;
            }
            else {
              selected4 = true;
              selected2 = false;
              selected1 = false;
              selected3 = false;
            }
          });
        },
        color: selected4 ? selectedcolor : Colors.white,
        textColor: Colors.black,
        hoverElevation: 6000,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Text(buttontext, style: TextStyle(
            fontSize: 14, color: selected4 ? selectedtextcolor : Colors.black)),
      ),
    );
  }

}

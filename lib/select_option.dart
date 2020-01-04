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
  String textload="pdf not loaded";
  bool load=false;


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
    load= true;



    if (!mounted) return;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SourceSansProRegular'),

      home: Scaffold(
        body: BackdropScaffold(
          title: Text("PISA EXAM 2016"),
          backLayer: Center(
            child: Text("Back Layer- McQ questions  "),
          ),
          frontLayer:
                Container(
                  height: double.infinity,

                  child: load ? PdfViewer(
                    filePath: path,
                    onPdfViewerCreated:(){
                      textload='Pdf loaded ';
                      setState(() {

                        load=true;

                      });
                    } ,

                  ): Center(
                    child: Text('Loading Question Paper...'),
                  ),


              ),
          iconPosition: BackdropIconPosition.leading,
        ),
      ),
      title: 'hello',
    );
  }
}

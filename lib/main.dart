import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_test_app/login_page.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() => runApp(MyApp());
ProgressDialog pr;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SourceSansProRegular'),

        home: mainUI());
  }
}

class DetailScreen extends StatelessWidget {
  @override
  String url;
  DetailScreen({@required this.url});

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class mainUI extends StatefulWidget {
  @override
  _mainUIState createState() => _mainUIState();
}

class _mainUIState extends State<mainUI> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('My Tabview'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Direction',
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Transit',
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Cycling',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          myBody(context),
          Icon(Icons.directions),
          Icon(Icons.directions_bike),
        ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Text(
                  'Demo Drawer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                )),
                decoration: BoxDecoration(
                  color: Colors.green[900],
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  //Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainUI()),
                  );

                },

              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 4'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 5'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 6'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myButtonCoumn(
      {Color color, IconData icon, String title, BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            final snackbar = SnackBar(content: Text(title));
            _scaffoldKey.currentState.showSnackBar(snackbar);
          },
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }

  Widget _myImage(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Image.network(
            'https://images.indianexpress.com/2019/12/Happy-New-Year_feature.jpg',
            fit: BoxFit.cover,
          ),
          onTap: () {
            pr = new ProgressDialog(context);

            if (pr.isShowing()) {
              pr.dismiss();
            } else {
              pr.show();
            }
          },
          onLongPress: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen(
                url:
                    'https://images.indianexpress.com/2019/12/Happy-New-Year_feature.jpg',
              );
            }));
          },
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget _buildmyButtonList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _myButtonCoumn(
              color: Colors.blue,
              icon: Icons.add_call,
              title: 'Call',
              context: context),
          _myButtonCoumn(
              color: Colors.blue,
              icon: Icons.rate_review,
              title: 'Rate',
              context: context),
          _myButtonCoumn(
              color: Colors.blue,
              icon: Icons.location_on,
              title: 'Route',
              context: context),
        ],
      ),
    );
  }

  Widget _myStoryText() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
              " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
              "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
              " It has survived not only five centuries, but also the leap into electronic typesetting,"
              " remaining essentially unchanged. It was popularised in the 1960s with the release of "
              "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software"
              " like Aldus PageMaker including versions of Lorem Ipsum."),
        ],
      ),
    );
  }

  Widget _mynewTitle() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "A big New year Store in Kolkata",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                ),
                Text(
                  "kolkata's  happy new year gifts",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text(
            "54",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget myBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        _myImage(context),
        _mynewTitle(),
        SizedBox(
          width: 200,
          height: 10,
        ),
        _buildmyButtonList(context),
        _myStoryText()
      ],
    );
  }
}

//MaterialApp(
//home: Scaffold(
//key: _scaffoldKey,
//appBar: AppBar(
//title: Text('My demo App'),
//),
//body: ListView(
//padding: EdgeInsets.all(0),
//children: <Widget>[
//_myImage(),
//_mynewTitle(),
//SizedBox(
//width: 200,
//height: 10,
//),
//_buildmyButtonList(context),
//_myStoryText()
//],
//),
//),
//);

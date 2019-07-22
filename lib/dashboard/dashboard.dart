import 'package:flutter/material.dart';

// import 'package:travelui/components/additionalMenu.dart';
// import 'package:travelui/components/promotion.dart';
import 'package:travelui/components/cardAccount.dart';
import 'package:travelui/components/mainmenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel X'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          CardAccount(),

          new Card(
            child: new Container(
              padding: new EdgeInsets.all(30.0),
              child: MainMenu(),
            ),
          ),
          Divider(),
          new Card(
            child: new Container(
              padding: new EdgeInsets.all(20.0),
              child: ButtonTheme(
                height: 15.0,
                minWidth: 15.0,
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  label: Text('Panic Button',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  color: Colors.redAccent[200],
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),

          // AdditionalMenu(),
          // Divider(),
          // Promotion()
        ],
      ),
    );
  }
}

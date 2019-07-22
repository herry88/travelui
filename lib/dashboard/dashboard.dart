import 'package:flutter/material.dart';

import 'package:travelui/components/additionalMenu.dart';
import 'package:travelui/components/promotion.dart';
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
        title: Text('TrapelokaKW'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {}
              ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          CardAccount(),
          
          new Card(
            child: new Container(
              padding: new EdgeInsets.all(32.0),
              child: MainMenu(),
            ),
            
          ),
          
          AdditionalMenu(),
          Divider(),
          Promotion()
        ],
      ),
    );
  }
}

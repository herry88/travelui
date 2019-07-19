import 'package:flutter/material.dart';
import 'package:travelui/components/cardAccount.dart';


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
        ],
      ),
    );
  }
}

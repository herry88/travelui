import 'package:flutter/material.dart';
import 'package:travelui/components/cardAccount.dart';
import 'package:travelui/components/mainmenu.dart';
//import 'package:flutter/foundation.dart';
//import 'dart:convert';
//import 'dart:async';
//import 'package:http/http.dart';

class User{
  final String name;

  User({this.name});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
      );
  }
}

//Future<List<User>> fetchGroups(http.Client client) async {
//  final response = await client.get('http://hijrah.asia/api/api/user/12/group');
//
//  // Use the compute function to run parsePhotos in a separate isolate.
//  return compute(parseUsers, response.body);
//}

//List<User> parseUsers(String responseBody) {
//  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//
//  return parsed.map<User>((json) => User.fromJson(json)).toList();
//}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  final List<User> users;

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

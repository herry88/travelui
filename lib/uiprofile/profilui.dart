import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';

Future<User> fetchPost() async {
  final response =
  await http.get('http://hijrah.asia/api/api/user/12');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class User{
  final int id;
  final String name;
  final String email;

  User({this.id, this.name, this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class UiProfileList extends StatefulWidget {
  @override
  _UiProfileListState createState() => _UiProfileListState();
}

class _UiProfileListState extends State<UiProfileList> {
  List<User> userData;
  Map data;
//  List userData;

//  Future getData() async {
//    http.Response response =
//        await http.get('http://hijrah.asia/api/api/user/12');
//    data = json.decode(response.body);
//    setState(() {
//      userData = data["data"];
//    });
//  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("user"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text("${userData[index].id}"),
                      )
                    ],
                  ),
              ),
            );
          }),
    );
  }
}

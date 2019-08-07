import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class User{
  final int id;
  final String name;
  final String email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email']
    );
  }
}
Future<List<User>> fetchUser(http.Client client) async{
  final response = await client.get('http://hijrah.asia/api/api/user/12');

  return compute(parseUser, response.body);
}

List<User> parseUser(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}


class UserListBuilder extends StatelessWidget {
  final List<User> users;

  UserListBuilder({this.users});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {

        return new Card(

            child: new Text("Id : ${users[index].id}\n" +
                "Sell Price : ${users[index].name}\n" +
                "Testimonial : ${users[index].email}\n")
        );
      },
    );
  }
}

class UiProfileList extends StatefulWidget {
  @override
  _UiProfileListState createState() => _UiProfileListState();
}

class _UiProfileListState extends State<UiProfileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("User List"),
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUser(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? UserListBuilder(users : snapshot.data)
              : Center(
            child: CircularProgressIndicator(),
          );
        },

      ),

    );
  }
}


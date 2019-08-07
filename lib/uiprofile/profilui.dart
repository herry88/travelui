import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';

class User {
  final int id;
//  final int user_id;
  final String name;
  final String email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
//        user_id: json['user_id'],
        name: json['name'],
        email: json['email']);
  }
}

Future<List<User>> fetchUsers(http.Client client) async {
  final response = await client.get('http://hijrah.asia/api/api/user/12');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseUsers, response.body);
}

List<User> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

class UsersListBuilder extends StatelessWidget {
  final List<User> users;

  UsersListBuilder({Key key, this.users});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return new Card(

            child: new Text("Id : ${users[index].id}\n" +
//                "User Id : ${gr[index].user_id}\n" +
                "Name : ${users[index].name}\n" +
                "Email : ${users[index].email}"
            )

        );

      },
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("User List"),
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? UsersListBuilder(users: snapshot.data)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';

class Group {
  final int id;
  final int user_id;
  final String city;
  final String referal;

  Group({this.id, this.user_id, this.city, this.referal});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        id: json['id'],
        user_id: json['user_id'],
        city: json['city'],
        referal: json['referal']);
  }
}

Future<List<Group>> fetchGroups(http.Client client) async {
  final response = await client.get('http://hijrah.asia/api/api/user/12/group');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseGroups, response.body);
}

List<Group> parseGroups(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Group>((json) => Group.fromJson(json)).toList();
}

class GroupsListBuilder extends StatelessWidget {
  final List<Group> groups;

  GroupsListBuilder({Key key, this.groups});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return new ListTile(
            title: new Text("Id : ${groups[index].id}\n" +
                "User Id : ${groups[index].user_id}\n" +
                "City : ${groups[index].city}\n" +
                "referal : ${groups[index].referal}"));
      },
    );
  }
}

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Groups List"),
      ),
      body: FutureBuilder<List<Group>>(
        future: fetchGroups(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? GroupsListBuilder(groups: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

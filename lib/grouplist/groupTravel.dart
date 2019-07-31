import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';

class Group {
  final String id;
  final String user_id;
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

Future<List<Group>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseGroups, response.body);
}

List<Group>parseGroups(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Group>((json) => Group.fromJson(json)).toList();
}

class GroupsListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemBuilder: groups.length,
        
    );
  }
}


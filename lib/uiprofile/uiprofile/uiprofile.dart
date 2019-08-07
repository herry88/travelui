import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String name;
  final String email;

  Post({this.id, this.name, this.email});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

Future<List<Post>> fetchUsers(http.Client client) async {
  final response = await http.get('http://hijrah.asia/api/api/user/12');
  return compute(parseUsers, response.body);
}

List<Post> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
} //


class UiListBuilder extends StatelessWidget {
  final List<Post> posts;

  UiListBuilder({Key key, this.posts}) : super(key: key);

  final String url =
      'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/04/15/lionel-messi-0.jpg?';
  final Color green = Color(0xFF1E8161);

  @override
  Widget build(BuildContext context) {
//    var length;
    return new ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Nama : ${posts[index].id}"),
        );
      },
    );
  }
}

class UiProfile extends StatefulWidget {
  @override
  _UiProfileState createState() => _UiProfileState();
}

class _UiProfileState extends State<UiProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {},
//          )
//        ],
      ),
      body: FutureBuilder<List<Post>>(
          future: fetchUsers(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? UiListBuilder(posts : snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}




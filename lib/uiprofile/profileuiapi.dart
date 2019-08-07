import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post{
  final int id;
  final String name;
  final String email;

  Post({this.id, this.name, this.email});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

Future<List<Post>> fetchUsers(http.Client client) async{
  final response = await http.get('http://hijrah.asia/api/api/user/12');
  return compute(parseUsers, response.body);
}

List<Post> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}//



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
          onPressed: () {
            //              MainMenu(),
          },
        ),
      ),
      body: new FutureBuilder<List<Post>>(
        future: fetchUsers(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new MyHomePage(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}



class MyHomePage extends StatelessWidget {
  final List<Post> list;
  MyHomePage({this.list});

  final String url = 'http://hijrah.asia/storage/upload/profile/LfSeFQBWcsmT2E1X3eZdoueYHedn4L7ZxDJayijm.jpeg';
  final Color green = Color(0xFF1E8161);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount:list == null ?  0  : list.length,
      itemBuilder: (BuildContext context,int index) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon:
                              Icon(Icons.message, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(url))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.phone, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "ID: ${list[index].id}",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Text(
                      "${list[index].name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.all(42),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.table_chart,
                            color: Colors.grey,
                          ),
                          Text(
                            'Leaders',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.show_chart,
                            color: Colors.grey,
                          ),
                          Text(
                            'Level up',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.card_giftcard,
                            color: Colors.grey,
                          ),
                          Text(
                            'Leaders',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.code,
                            color: Colors.grey,
                          ),
                          Text('QR code')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.blur_circular,
                            color: Colors.grey,
                          ),
                          Text('Daily bonus')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                          Text('Visitors')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

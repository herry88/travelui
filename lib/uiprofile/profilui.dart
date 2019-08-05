import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//class Post {
//  final int id;
//  final String name;
//  final String email;
//
//  Post({this.name, this.email,this.id});
//
//  factory Post.fromJson(Map<String, dynamic> json){
//    return Post(
//        id    : json['id'],
//        name  : json['name'],
//        email : json['email'],
//    );
//  }
//}
//
//Future<Post>fetchPost(http.Client client) async{
//  final response =  await http.get('http://hijrah.asia/api/api/user/12');
//
//  if(response.statusCode == 200) {
//    return Post.fromJson(json.decode(response.body));
//  }
//  else{
//    throw Exception('Failed to load Post');
//  }
//}
//
//List<Post> parsePosts(String responseBody){
//  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
//}
//


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data;
  List UserData;

  Future getData() async{
    http.Response response = await http.get("http://hijrah.asia/api/api/user/12/");
    data = json.decode(response.body);
    setState(() {
      UserData = data["data"];
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  final String url = 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/04/15/lionel-messi-0.jpg?';
  final Color green = Color(0xFF1E8161);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0,
        backgroundColor: green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),

      ),
      body: ListView.builder(
        itemCount: UserData == null ? 0 : UserData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32)
                  ),
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
                                icon: Icon(Icons.message, color: Colors.white,),
                                onPressed: (){},
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
                                  image: NetworkImage(url)
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.phone, color: Colors.white,),
                                onPressed: (){},
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10
                      ),
                      child: Text("ID: ${UserData[index]["id"]}",
                        style: TextStyle(
                            color: Colors.white70
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: Text('Herman Jimenez',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.group_add, color: Colors.white,),
                              Text('Friends',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.group, color: Colors.white,),
                              Text('Groups',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.videocam, color: Colors.white,),
                              Text('Videos',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.favorite, color: Colors.white,),
                              Text('Likes',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                padding: EdgeInsets.all(42),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.table_chart, color: Colors.grey,),
                            Text('Leaders',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.show_chart, color: Colors.grey,),
                            Text('Level up',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.card_giftcard, color: Colors.grey,),
                            Text('Leaders',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
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
                            Icon(Icons.code, color: Colors.grey,),
                            Text('QR code')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.blur_circular, color: Colors.grey,),
                            Text('Daily bonus')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.visibility, color: Colors.grey,),
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
        }
      ),
    );
  }
}
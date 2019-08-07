import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http.get("http://hijrah.asia/api/api/user/12/group");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GroupList"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
//                  CircleAvatar(
////                    backgroundImage: NetworkImage(userData[index]["id"]),
//                      child: Text("${userData[index]["order_id"]}"),
//                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${userData[index]["referal"]} ${userData[index]["city"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
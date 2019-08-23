import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<Initerary> getData() async{
  final response = await http.get('http://hijrah.asia/api/api/user/12/itinerary');

  if(response.statusCode == 200){
    return Initerary.fromJson(json.decode(response.body));
  } else{
    throw Exception('Failed to load initerary');
  }
}

class Initerary{
  final String package_name;
  final String package_date;
  final String itinerary;

  Initerary({this.package_name, this.package_date, this.itinerary});

  factory Initerary.fromJson(Map<String, dynamic> json){
    return Initerary(
      package_name: json['package_name'],
      package_date: json['package_date'],
      itinerary: json['itinerary'],
    );
  }
}

class IniteraryPage extends StatefulWidget {
  @override
  _IniteraryPageState createState() => _IniteraryPageState();
}

class _IniteraryPageState extends State<IniteraryPage> {
  Future<List>getData() async{
    final response = await http.get("http://hijrah.asia/api/api/user/12/itinerary");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Initerary Page'),
        backgroundColor: Colors.blue,
      ),
      body: new FutureBuilder<List>(
        future: getData(),
          builder: (context, snapshot){
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData ? new IniteraryList(list: snapshot.data)
                  : new Center(
                child: CircularProgressIndicator(),
              );
          },
      ),
    );
  }
}

class IniteraryList extends StatelessWidget {
  final List list;
  IniteraryList({Key key,this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    var indicatorValue;
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//          value: list.package_name,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      ),
    );

  }
}

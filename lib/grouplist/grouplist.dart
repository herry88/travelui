import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class PageMainSiswa extends StatefulWidget {
  @override
  _PageMainSiswaState createState() => _PageMainSiswaState();
}

class _PageMainSiswaState extends State<PageMainSiswa> {
  Future<List> getData() async {
    final response = await http.get("http://travel1.cloudengine.live/api/user/12");
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Siswa'),
        backgroundColor: Colors.green,
      ),
      body: new FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List list;
  ItemList({this.list});
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder( itemCount: widget.list ==  null ? 0 : widget.list.length,
      itemBuilder: (context, i){
        return new Container(
          child: new GestureDetector(
            onTap: (){

            },
            child: new Card(
              color: Colors.white,
              child: ListTile(title: Text(widget.list[i]['name']),
                leading: Icon(Icons.list),
                subtitle: Text('Alamat : ${widget.list[i]['phone']}'),
              ),
            ),
          ),
        );
      },
    );
  }
}
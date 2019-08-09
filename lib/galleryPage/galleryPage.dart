import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  final String title; 
  GalleryPage({this.title}) : super();
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : new AppBar(
        title : new Text(widget.title),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 159.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5.0),
        // children: _buildGridTiles(29),
      ),
    );
  }
}
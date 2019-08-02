import 'package:flutter/material.dart';
// import 'package:grid_layout/gridview.dart';

class MyGridView {
  Card getStructuredGridCell(name, image) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Image(image: new AssetImage('assets/images/' + image)),
            new Center(
              child: new Text(name),
            )
          ],
        ));
  }

  GridView build() {
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("Facebook", "assets/images/blank.jpg"),
        getStructuredGridCell("Twitter", "assets/images/dashboard.jpg"),
        getStructuredGridCell("Instagram", "assets/images/login.jpg"),
        getStructuredGridCell("Linkedin", "assets/images/photo.jpg"),
        // getStructuredGridCell("Launcher Icon", "ic_launcher.png"),
      ],
    );
  }
}
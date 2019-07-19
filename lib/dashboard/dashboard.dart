import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//import 'dart:async';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  Size deviceSize;
  @override
  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                        defaultTargetPlatform == TargetPlatform.android
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios,
                        color: Colors.white),
                    onPressed: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

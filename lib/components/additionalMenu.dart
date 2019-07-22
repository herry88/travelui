import 'package:flutter/material.dart';

class AdditionalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(vertical:22.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: additionalMenuItem,
      ), 
    );
  }
}

List<AdditionalMenuItem>additionalMenuItem = [
  AdditionalMenuItem(title:'Movies', icon: Icons.movie),
];

class AdditionalMenuItem extends StatelessWidget {
  final IconData icon; 
  final String title;

  AdditionalMenuItem({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(
        children: <Widget>[
          Icon(icon),
          Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12.0),)
        ],
      ),
    );
  }
}
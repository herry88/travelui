import 'package:flutter/material.dart';

List<MainMenuItem> mainMenuItem = [
  MainMenuItem(
    title : 'Flights',
    icon : Icons.flight, 
    colorBox : Colors.blue, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
];

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 4.0,
      children: mainMenuItem,
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final String title, screenTitle, screenContent;
  final IconData icon; 
  final Color colorBox, iconColor; 
  final Widget screenWidget; 

  MainMenuItem({this.title, this.colorBox, this.iconColor, this.screenTitle, this.screenContent, this.screenWidget, this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
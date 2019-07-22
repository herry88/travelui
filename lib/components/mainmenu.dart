import 'package:flutter/material.dart';
import '../page/screen.dart';
import '../page/allProduct.dart';

List<MainMenuItem> mainMenuItem = [
  MainMenuItem(
    title : 'Flights',
    icon : Icons.flight, 
    colorBox : Colors.blue, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
  MainMenuItem(
    title : 'Profile',
    icon : Icons.android,
    colorBox : Colors.green, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
 
  MainMenuItem(
    title : 'Order',
    icon : Icons.payment, 
    colorBox : Colors.orange, 
    iconColor : Colors.white, 
    screenTitle : 'Search Payment',
    screenContent:'Pencarian'
  ),
  MainMenuItem(
    title : 'Itinerary',
    icon : Icons.airplay, 
    colorBox : Colors.lightGreen, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
   MainMenuItem(
    title : 'Gallery',
    icon : Icons.photo_library, 
    colorBox : Colors.lightGreen, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
   MainMenuItem(
    title : 'Napak Tilas',
    icon : Icons.local_movies, 
    colorBox : Colors.greenAccent, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
   MainMenuItem(
    title : 'Oleh Oleh',
    icon : Icons.stay_current_landscape, 
    colorBox : Colors.limeAccent, 
    iconColor : Colors.white, 
    screenTitle : 'Search Flight',
    screenContent:'Pencarian'
  ),
  MainMenuItem(
    title : 'All Product',
    icon : Icons.apps, 
    colorBox : Colors.grey, 
    iconColor : Colors.white, 
    screenTitle : 'All Product',
    screenWidget: AllProduct()
  ),
  
];

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GridView.count(      
      shrinkWrap: true,
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      mainAxisSpacing: 10.0,
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
    return Column(
      children: <Widget>[
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: colorBox, 
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: iconColor),
            onPressed: (){
              Route route = MaterialPageRoute(
                builder: (context){
                  if(screenWidget == null){
                      return ScreenGeneral(
                        title: screenTitle, 
                        content : screenContent,
                      );
                  }
                  return screenWidget;
                }
              );
              Navigator.of(context).push(route);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(title, style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
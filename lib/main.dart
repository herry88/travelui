import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:travelui/components/mainmenu.dart';
//import 'pages/account.dart';
//import 'pages/order.dart';
// import 'package:travelui/loginPage.dart';
import 'package:travelui/dashboard/dashboard.dart';
import 'package:travelui/page/allProduct.dart';
import 'package:travelui/page/galleryimage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //widget your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Aja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TravelAja'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _layoutPage = [
    // Login(),
    Home(),
    MainMenu(),
    GalleryImage(),
    AllProduct(),
//    Inbox(),
//    Account()
  ];



  void _onTabItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
//      bottomNavigationBar: BottomNavigationBar(
//          currentIndex: _selectedIndex,
//          type: BottomNavigationBarType.fixed,
//          fixedColor: Colors.blue[900],
//          onTap: _onTabItem,
//          items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('Home')
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.list),
//                title: Text('History')
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.photo_library),
//                title: Text('Gallery')
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.person),
//                title: Text('Account'),
//            ),
//          ],
//      ),
    );
  }
}





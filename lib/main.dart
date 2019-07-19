import 'package:flutter/material.dart';
//import 'pages/account.dart';
//import 'pages/order.dart';
import 'package:travelui/dashboard/dashboard.dart';

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
    Home(),
    Saved(),
    Order(),
    Group(),
    Inbox(),
    Account()
  ];



  void _onTabItem(){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue[900],
          onTap: _onTabItem,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              title: Text('Home')
            ),
          ],
      ),
    );
  }
}





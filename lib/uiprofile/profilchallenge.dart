import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String url = 'http://hijrah.asia/storage/upload/profile/LfSeFQBWcsmT2E1X3eZdoueYHedn4L7ZxDJayijm.jpeg';
//  final Color green = Color(0xFF1E8161);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
//        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: (){},
//          )
//        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 18),
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height/2,
//            decoration: BoxDecoration(
////              color: Colors.blue,
//              borderRadius: BorderRadius.only(
//                  bottomRight: Radius.circular(32),
//                  bottomLeft: Radius.circular(32)
//              ),
//            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.message, color: Colors.green,),
                            onPressed: (){},
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(url)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.phone, color: Colors.green,),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16
                  ),
                  child: Text("ID: 1",
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text('admin',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Divider()
//                Padding(
//                  padding: const EdgeInsets.only(left: 16, right: 16),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Column(
//                        children: <Widget>[
//                          Icon(Icons.group_add, color: Colors.white,),
//                          Text('Friends',
//                            style: TextStyle(
//                                color: Colors.white
//                            ),
//                          ),
//                        ],
//                      ),
//                      Column(
//                        children: <Widget>[
//                          Icon(Icons.group, color: Colors.white,),
//                          Text('Groups',
//                            style: TextStyle(
//                                color: Colors.white
//                            ),
//                          ),
//                        ],
//                      ),
//                      Column(
//                        children: <Widget>[
//                          Icon(Icons.videocam, color: Colors.white,),
//                          Text('Videos',
//                            style: TextStyle(
//                                color: Colors.white
//                            ),
//                          ),
//                        ],
//                      ),
//                      Column(
//                        children: <Widget>[
//                          Icon(Icons.favorite, color: Colors.white,),
//                          Text('Likes',
//                            style: TextStyle(
//                                color: Colors.white
//                            ),
//                          ),
//                        ],
//                      )
//                    ],
//                  ),
//                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/3,
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.blue,),
//                        new Text('Nama Alias', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                        Text('Admin',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Icon(Icons.email, color: Colors.blue,),
                        Text('admin@gmail.com',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.phone_android, color: Colors.blue,),
                        Text('null')
                      ],
                    ),
//                    Column(
//                      children: <Widget>[
//                        Icon(Icons.blur_circular, color: Colors.grey,),
//                        Text('Daily bonus')
//                      ],
//                    ),
//                    Column(
//                      children: <Widget>[
//                        Icon(Icons.visibility, color: Colors.grey,),
//                        Text('Visitors')
//                      ],
//                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
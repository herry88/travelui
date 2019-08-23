import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();

  @override
  void initState() {
    //TODO : implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      body: new ListView(
        shrinkWrap: true,
        reverse: false,
        children: <Widget>[
          new SizedBox(
            height: 20.0,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: new Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 30.0,
              ),
              new Center(
                child: new CircleAvatar(
                  backgroundImage: ExactAssetImage("assets/images/mapaja.png"),
                  minRadius: 150.0,
                  maxRadius: 150.0,
                ),
              ),
              new Center(
                child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: new Form(
                            autovalidate: false,
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: new TextFormField(
                                    controller: email_controller,
                                    autofocus: false,
                                    decoration: new InputDecoration(
                                        labelText: "Username",
                                        prefixIcon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 7.0),
                                            child: new Icon(Icons.person_pin)
                                        )),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                //Password UI-----------------------------------
                                new Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: new TextFormField(
                                    controller: password_controller,
                                    autofocus: false,
                                    decoration: new InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(right: 7.0),
                                        child: new Icon(Icons.vpn_key),

                                      )
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

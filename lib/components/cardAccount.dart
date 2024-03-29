import 'package:flutter/material.dart';

class CardAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          'Herry Prasetyo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/images/profile.jpg")
                    )
              ),
        ),
        subtitle: Row(
          children: <Widget>[
            // RaisedButton.icon(
            //   icon: Icon(
            //     Icons.warning,
            //     color: Colors.white,
            //   ),
            //   label: Text('Panic Button'),
            //   onPressed: () {},
            //   color: Colors.redAccent[200],
            //   elevation: 0.0,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0)),
                  
            // ),
            Padding(padding: EdgeInsets.all(8.0),),
            // RaisedButton(
            //   child: Text('Panic Button'),
            //   onPressed: (){},
            //   color: Colors.red[200],
            //   elevation: 0.0,
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            // )
          ],
        ),
      ),
    );
  }
}

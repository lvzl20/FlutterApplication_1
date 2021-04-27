import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/User_Info/_user_info.dart';

// import 'package:flutter/material.dart';

// class MyWidget2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: UserLogCheckState(),
//     );
//   }
// }

// class UserLogCheckState extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => UserLog();
// }

class UserLog extends StatelessWidget {
  var name = Person.person.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name + '的主页'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Image.asset(Person.person.pic),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('注销'),
          ),
        ],
      ),
    );
  }
}

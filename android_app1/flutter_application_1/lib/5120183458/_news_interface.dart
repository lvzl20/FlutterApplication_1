import 'package:flutter/material.dart';

class NewsInterface extends StatelessWidget {
  final String name;
  NewsInterface({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻界面'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text('这是一个新闻界面'),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('返回'),
          ),
        ],
      ),
    );
  }
}

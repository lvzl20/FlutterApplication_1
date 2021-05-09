import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/User_Info/_user_info.dart';
import 'package:flutter_application_1/5120183458/_news_interface.dart';
import 'package:flutter_application_1/5120183458/_news_info.dart';
// import 'package:flutter/material.dart';

class MyWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: UserLogCheckState(),
    );
  }
}

class UserLogCheckState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserLog();
}

class UserLog extends State<UserLogCheckState> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('自定义新闻浏览器'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Help(),
                    ),
                  );
                });
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '新闻主页',
              ),
              Tab(
                text: '个人信息',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ShowNews(),
            ShowUser(),
          ],
        ),
      ),
    );
  }
}

// 显示顶部说明按钮的消息
class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('这是一个关于该APP的说明界面'),
        RaisedButton(
          child: Text('返回'),
          onPressed: () {
            Person.init();
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}

// 显示新闻消息
class ShowNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _listView(),
    );
  }

  Widget _listView() {
    //构造数据
    var nameList = ["新闻消息"];
    for (var i = 1; i <= 50; i++) {
      nameList.add("新闻消息$i");
    }
    return new ListView.builder(
      //listview的子项item数量
      itemCount: nameList.length,
      padding: new EdgeInsets.all(5.0),
      itemBuilder: (BuildContext context, int index) {
        //返回每个子项item的widget
        //这里只是简单拿到数据列表中的数据,并以此为参数构造成了显示姓名的Widget
        return _listItemView(nameList[index], context);
      },
    );
  }

  Widget _listItemView(String name, context) {
    return Row(
      children: [
        Center(
          child: RaisedButton(
            child: Text(name),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new NewsInterface(),
                  ));
            },
          ),
        ),
      ],
    );
  }
}

var Image_url =
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2496571732,442429806&fm=26&gp=0.jpg';

// 显示用户的个人信息
class ShowUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(Image_url),
          ),
          title: Text('账号'),
          subtitle: Text(Person.person.useraccount),
          // trailing: Icon(Icons.keyboard_arrow_right),
          // onTap: () {
          //   print('我的账号');
          // },
          // selected: true,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(Image_url),
          ),
          title: Text('用户名'),
          subtitle: Text(Person.person.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('我的名字');
          },
          selected: true,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(Image_url),
          ),
          title: Text('更改密码'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('我的密码');
          },
          selected: true,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(Image_url),
          ),
          title: Text('注销'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
          },
          selected: true,
        ),
      ],
    );
  }
}
// class UserLog extends StatelessWidget {
//   var name = Person.person.name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name + '的界面'),
//         centerTitle: true,
//       ),
//       // body: Column(
//       //   children: <Widget>[
//       //     Container(
//       //       height: 50.0,
//       //       width: 50.0,
//       //       child: Image.asset(Person.person.pic),
//       //     ),
//       //     RaisedButton(
//       //       onPressed: () {
//       //         Navigator.pop(context);
//       //       },
//       //       child: Text('注销'),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/5120183458/_sign_up.dart';
import 'package:flutter_application_1/User_Info/_user_info.dart';
import 'package:flutter_application_1/5120183458/user_log.dart';

class MyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFieldAndCheckPage(),
    );
  }
}

class TextFieldAndCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Login();
}

class Login extends State<TextFieldAndCheckPage> {
  // 手机号控制器
  TextEditingController pnumController = TextEditingController();
  // 密码控制器
  TextEditingController pwdController = TextEditingController();
  // 显示与隐藏密码
  bool isCanSee = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录界面'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: pnumController,
            keyboardType: TextInputType.number,
            maxLength: 18,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: '请输入您的用户名',
              helperText: '首次登陆请进行注册',
            ),
            autofocus: false,
          ),
          TextField(
            controller: pwdController,
            keyboardType: TextInputType.number,
            maxLength: 16,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.lock),
              labelText: '请输入密码',
            ),
            obscureText: isCanSee,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _login,
                child: Text('登录'),
              ),
              RaisedButton(
                onPressed: () {
                  onTextClear();
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  });
                },
                child: Text('注册'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    isCanSee = !isCanSee;
                  });
                },
                child: Text('显示/隐藏密码'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _login() {
    print({'phone': pnumController.text, 'password': pwdController.text});
    var phonelength = pnumController.text.length;
    var pwdlength = pwdController.text.length;
    if (phonelength != 11) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('请输入十一位手机号!'),
        ),
      );
      pnumController.clear();
    } else if (pwdlength < 6) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('密码长度不得低于6位数!'),
        ),
      );
    } else {
      int val = Person.log_judge(pnumController.text, pwdController.text);
      if (val == 1) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('您输入的账号不存在!'),
          ),
        );
      } else if (val == 2) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('密码错误!'),
          ),
        );
        pwdController.clear();
      } else if (val == 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('注销成功!'),
          ),
        );
        onTextClear();
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserLog(),
            ),
          );
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登陆成功!'),
          ),
        );
      }
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Text('登录成功!'),
      //   ),
      // );
      // onTextClear();
    }
  }

  void onTextClear() {
    setState(() {
      pnumController.clear();
      pwdController.clear();
    });
  }
}

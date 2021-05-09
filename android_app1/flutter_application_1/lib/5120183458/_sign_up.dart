import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/User_Info/_user_info.dart';

class SignUp extends StatelessWidget {
  // 手机号控制器
  TextEditingController pnumController = TextEditingController();
  // 密码控制器
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册界面'),
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
              helperText: '请输入需要注册的手机号',
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
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _judge(context),
                child: Text('检查合法性'),
              ),
              RaisedButton(
                onPressed: () {
                  var name = 'xiaobai_' + pnumController.text;
                  // var name = '自定义新闻浏览器';
                  var person = new UserInfo(
                      pnumController.text, pwdController.text, name);
                  person.pic = 'images/test1.jpg';
                  Person.UserInfoList.add(person);
                  Navigator.pop(context);
                },
                child: Text('完成注册'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _judge(BuildContext context) {
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
    } else if (Person.signup_judge(pnumController.text) == 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('该账户已存在!'),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('可以注册该账户!'),
        ),
      );
    }
  }
}

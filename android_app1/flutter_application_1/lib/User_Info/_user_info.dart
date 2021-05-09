// import 'package:flutter/material.dart';

import 'dart:developer';

class UserInfo {
  String useraccount;
  String userpassword;
  String name; // 昵称
  String pic; // 头像
  String sex; // 性别
  int age; //年龄
  int rank; //等级
  UserInfo(String account, String password, String name) {
    useraccount = account;
    userpassword = password;
    this.name = name;
    age = 0;
    rank = 1;
    sex = "男";
    pic = "";
  }
}

class Person {
  //存储用户类的数组
  static UserInfo person;
  static var UserInfoList = new List();
  static int log_judge(String useracc, String userpwd) {
    if (UserInfoList.isEmpty) {
      // print('该账号不存在');
      return 1;
    }
    for (var i = 0; i < UserInfoList.length; i++) {
      if (UserInfoList[i].useraccount == useracc) {
        if (UserInfoList[i].userpassword != userpwd) {
          // print('密码错误');
          return 2;
        } else {
          // print('登陆成功!');
          person = UserInfoList[i];
          return 0;
        }
      }
    }
    // 没找到账号
    return 1;
  }

  static int signup_judge(String useracc) {
    for (var i = 0; i < UserInfoList.length; i++) {
      if (UserInfoList[i].useraccount == useracc) {
        // 账号已经存在
        return 1;
      }
    }
    // 注册成功
    return 0;
  }

  static void init() {
    person = new UserInfo('12345678912', '123123', 'xiaobai' + '12345678912');
    person.pic = 'images/test1.jpg';
    Person.UserInfoList.add(person);
  }
}

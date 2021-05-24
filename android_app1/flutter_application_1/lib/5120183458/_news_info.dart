import 'package:flutter/material.dart';

class News {
  int code; //状态编码
  String msg; //状态信息
  String ctime; //创建时间
  String title; //新闻标题
  String description; //新闻介绍
  String picUrl; //新闻图片地址
  String url; //新闻链接地址
  News(
      {this.code,
      this.msg,
      this.ctime,
      this.title,
      this.description,
      this.picUrl,
      this.url});
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        code: json['code'],
        msg: json['msg'],
        ctime: json['ctime'],
        title: json['title'],
        description: json['description'],
        picUrl: json['picUrl'],
        url: json['url']);
  }
}

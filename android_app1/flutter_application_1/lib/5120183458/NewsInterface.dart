import 'package:flutter/material.dart';
import 'package:flutter_application_1/5120183458/_news_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int pageNum = 1;

Future<List<News>> getDatas() async {
  final response = await http.get(Uri.parse(
      'http://api.tianapi.com/generalnews/index?key=13d00a50a6581693d2ca2ee0b4d4c449&num=10&page=$pageNum'));
  Utf8Decoder decode = new Utf8Decoder();
  Map<String, dynamic> result = jsonDecode(decode.convert(response.bodyBytes));
  //print(result);
  List<News> datas; //转列表
  datas = result['newslist'].map<News>((item) => News.fromJson(item)).toList();
  pageNum += 1;
  return datas; //返回 初始化
}

// 显示新闻消息
class NewsPage extends StatefulWidget {
  // final int Isbuff; // 是否刷新了
  // const NewsPage({Key key, this.Isbuff}) : super(key: key);
  // const NewsDetail({Key key, this.url, this.title}) : super(key: key);
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewsPage> {
  List<News> _datas = [];
  bool _cancelConnect = false; // 请求数据标志位
  @override
  void initState() {
    // 未请求过数据，当数据得到后更新新闻数据列表变量_datas，并刷新界面
    getDatas()
        .then((List<News> datas) {
          if (!_cancelConnect) {
            setState(() {
              _datas = datas; // 初始化state，重新刷新界面
            });
          }
        })
        .catchError((e) {
          // 如果获取数据出错，打印错误信息
          print('error$e');
        })
        .whenComplete(() {
          // 没有错误，打印新闻获取完毕
          print('新闻获取完毕');
          print('page=$pageNum');
        })
        .timeout(Duration(seconds: 5))
        .catchError((timeOut) {
          // 指定时间超时后，打印超时，更改数据请求标志位，不再请求更新数据
          print('超时:${timeOut}');
          _cancelConnect = true;
        });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      // getDatas();
      getDatas()
          .then((List<News> datas) {
            if (!_cancelConnect) {
              setState(() {
                _datas = datas; // 初始化state，重新刷新界面
              });
            }
          })
          .catchError((e) {
            // 如果获取数据出错，打印错误信息
            print('error$e');
          })
          .whenComplete(() {
            // 没有错误，打印新闻获取完毕
            print('新闻获取完毕');
            print('page=$pageNum');
          })
          .timeout(Duration(seconds: 5))
          .catchError((timeOut) {
            // 指定时间超时后，打印超时，更改数据请求标志位，不再请求更新数据
            print('超时:${timeOut}');
            // _cancelConnect = true;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _datas.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: Colors.grey[250],
              elevation: 5.0,
              child: Builder(
                builder: (context) => InkWell(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(_datas[index].picUrl as String,
                            fit: BoxFit.fitWidth),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            _datas[index].title.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: _datas[index].description.toString().isEmpty
                              ? const EdgeInsets.all(0.0)
                              : const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10.0),
                          child: Text(
                            _datas[index].description.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            '时间: ${_datas[index].ctime}',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    // onTap: () => Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => NewsDetail(
                    //             url: _datas[index].url.toString(),
                    //             title: _datas[index].title.toString(),
                    //           )),
                    // ),
                    // 调用系统浏览器打开网页
                    onTap: () async => {
                          // String url = _datas[idx].url.toString();
                          if (await canLaunch(_datas[index].url.toString()))
                            {
                              await launch(_datas[index].url.toString()),
                              print('成功访问url = ${_datas[index].url.toString()}')
                            }
                          else
                            {
                              print('不能访问'),
                              print('url = ${_datas[index].url.toString()}')
                            }
                        }),
              ));
        },
      ),
    ));
  }
}

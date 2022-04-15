import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/page/home/home_json.dart';
import 'package:flutter_pajkb/ui/page/home/model/home_model.dart';

/**
 * 首页
 * */
class JKBHomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  State<JKBHomePage> createState() => _JKBHomePageState();
}

class _JKBHomePageState extends State<JKBHomePage> {
  late JKBHomeModel _homeModel;

  @override
  Widget build(BuildContext context) {

    //获取首页json数据
    JKBHomeJsonParse.getHomeData().then((value) {
      setState(() {
        _homeModel = value;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Text(_homeModel.title!),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/page/home/home_content.dart';
import 'package:flutter_pajkb/ui/page/home/home_json.dart';


/**
 * 首页
 * */
class JKBHomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  State<JKBHomePage> createState() => _JKBHomePageState();
}

class _JKBHomePageState extends State<JKBHomePage> {
  List _floorModels = [];

  @override
  void initState() {
    super.initState();

    //获取首页json数据
    JKBHomeJsonParse.getHomeData().then((value) {
      setState(() {
        _floorModels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: JKBHomeContent(_floorModels),
    );
  }
}

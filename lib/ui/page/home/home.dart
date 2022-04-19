import 'package:flutter/material.dart';
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
//  late JKBFloorBannerModel _homeModel;
  int _count = 0;

  @override
  void initState() {
    super.initState();

    //获取首页json数据
    JKBHomeJsonParse.getHomeData().then((value) {
      setState(() {
        _count = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //数据为空保护
//    final int title = _homeModel.templateId;

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Text("楼层个数==$_count"),
    );
  }
}

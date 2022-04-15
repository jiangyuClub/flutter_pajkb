
import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/page/expert/expert.dart';
import 'package:flutter_pajkb/ui/page/health/health.dart';
import 'package:flutter_pajkb/ui/page/home/home.dart';
import 'package:flutter_pajkb/ui/page/mine/mine.dart';
import 'package:flutter_pajkb/ui/page/product/product.dart';
import 'package:flutter_pajkb/ui/page/root/root.dart';

class JKBRoute {
  //默认app显示的页面route
  static final String initialRoute = JKBRootPage.routeName;

  //所有支持路由页面
  static final Map<String, WidgetBuilder> routes = {
    JKBRootPage.routeName: (ctx) => JKBRootPage(),
    JKBHomePage.routeName: (ctx) => JKBHomePage(),
    JKBProductPage.routeName: (ctx) => JKBProductPage(),
    JKBHealthPage.routeName: (ctx) => JKBHealthPage(),
    JKBExpertPage.routeName: (ctx) => JKBExpertPage(),
    JKBMinePage.routeName: (ctx) => JKBMinePage(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  //未匹配路由处理
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
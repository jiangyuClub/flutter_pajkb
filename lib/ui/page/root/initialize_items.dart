import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/page/expert/expert.dart';
import 'package:flutter_pajkb/ui/page/health/health.dart';
import 'package:flutter_pajkb/ui/page/home/home.dart';
import 'package:flutter_pajkb/ui/page/mine/mine.dart';
import 'package:flutter_pajkb/ui/page/product/product.dart';

final List<Widget> pages = [
  JKBHomePage(),
  JKBProductPage(),
  JKBHealthPage(),
  JKBExpertPage(),
  JKBMinePage()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      label: "首页",
      icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
      label: "保险",
      icon: Icon(Icons.star)
  ),
  BottomNavigationBarItem(
      label: "健康",
      icon: Icon(Icons.star)
  ),
  BottomNavigationBarItem(
      label: "专家",
      icon: Icon(Icons.star)
  ),
  BottomNavigationBarItem(
      label: "我的",
      icon: Icon(Icons.star)
  )
];

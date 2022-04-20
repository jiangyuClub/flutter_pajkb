import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/page/expert/expert.dart';
import 'package:flutter_pajkb/ui/page/health/health.dart';
import 'package:flutter_pajkb/ui/page/home/home.dart';
import 'package:flutter_pajkb/ui/page/mine/mine.dart';
import 'package:flutter_pajkb/ui/page/product/product.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

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
      icon: Image.asset("assets/images/tabbar/tab_button_shouye_normal@2x.png", width: 30.px,),
      activeIcon: Image.asset("assets/images/tabbar/tab_button_shouye_press@2x.png", width: 30.px,)
  ),
  BottomNavigationBarItem(
      label: "保险",
      icon: Image.asset("assets/images/tabbar/tab_button_baoxian_normal@2x.png", width: 30.px,),
      activeIcon: Image.asset("assets/images/tabbar/tab_button_baoxian_press@2x.png", width: 30.px,)
  ),
  BottomNavigationBarItem(
      label: "健康",
      icon: Image.asset("assets/images/tabbar/tab_button_jiankang_normal@2x.png", width: 30.px,),
      activeIcon: Image.asset("assets/images/tabbar/tab_button_jiankang_press@2x.png", width: 30.px,)
  ),
  BottomNavigationBarItem(
      label: "专家",
      icon: Image.asset("assets/images/tabbar/tab_button_expert_normal@2x.png", width: 30.px,),
      activeIcon: Image.asset("assets/images/tabbar/tab_button_expert_press@2x.png", width: 30.px,)
  ),
  BottomNavigationBarItem(
      label: "我的",
      icon: Image.asset("assets/images/tabbar/tab_button_wode_normal@2x.png", width: 30.px,),
      activeIcon: Image.asset("assets/images/tabbar/tab_button_wode_press@2x.png", width: 30.px,)
  )
];

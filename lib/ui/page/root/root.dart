import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/page/root/initialize_items.dart';

/**
 * 跟组件，承载barbar
 * */
class JKBRootPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<JKBRootPage> createState() => _JKBRootPageState();
}

class _JKBRootPageState extends State<JKBRootPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,//主要用于设置item及字体颜色
        selectedItemColor: Colors.orange,//主要用于设置item及字体颜色
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

}

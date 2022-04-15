import 'package:flutter/material.dart';

class JKBAppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 30;


  // 2.普通模式
  static final Color norTextColors = Colors.black;

  static final ThemeData norTheme = ThemeData(
    //主题色
    primarySwatch: Colors.orange,
    //背景色
    canvasColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: bodyFontSize),
    )
  );


  // 3.暗黑模式
  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: normalFontSize, color: darkTextColors)
    )
  );
}
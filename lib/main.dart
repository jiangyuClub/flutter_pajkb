import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/route/route.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/size_fit.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //适配器初始化
    JKBSizeFit.initialize();

    return MaterialApp(
      title: '平安健康保flutter',
      theme: JKBAppTheme.norTheme,
      initialRoute: JKBRoute.initialRoute,
      routes: JKBRoute.routes,
      onGenerateRoute: JKBRoute.generateRoute,
      onUnknownRoute: JKBRoute.unknownRoute,
    );
  }
}

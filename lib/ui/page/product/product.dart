import 'package:flutter/material.dart';

class JKBProductPage extends StatelessWidget {
  static const String routeName = "/product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("保险产品"),
      ),
      body: Text("保险产品"),
    );
  }
}

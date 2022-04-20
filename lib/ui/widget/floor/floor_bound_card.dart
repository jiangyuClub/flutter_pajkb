import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

/**
 * 楼层外边框
 * */
Widget buildRoundedCard({Color bgColor = Colors.white, required Widget child}) {
  return Card(
      color: bgColor,
      margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 10.px),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.px)),
      child: child
  );
}
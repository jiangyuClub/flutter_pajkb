import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_ensure_model.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/size_fit.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';
import 'package:flutter_pajkb/ui/widget/floor/common/floor_bound_card.dart';

/**
 * 左右标题楼层
 * */
class JKBFloorEnsure extends StatelessWidget {
  List<EnsureModelList> _ensures = [];

  JKBFloorEnsure(this._ensures);

  @override
  Widget build(BuildContext context) {
    return buildRoundedCard(
        bgColor: Colors.orange,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildEnsureItem(_ensures[0]),
            Container(width: 1.px, height: 50.px, color: Colors.white,),
            buildEnsureItem(_ensures[1])
          ],
        )
    );
  }



  Widget buildEnsureItem(EnsureModelList ensure) {
    return Container(
      width: (JKBSizeFit.screenWidth - 30.px)/2 - 1.px,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 15.px, top: 15.px),
              child: Text(ensure.memberGradeName!, style: TextStyle(color: Colors.white, fontSize: JKBAppTheme.normalFontSize),)
          ),
          Container(
              padding: EdgeInsets.only(left: 15.px, top: 10.px, bottom: 15.px),
              child: Text(ensure.subTitle!, style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }

}

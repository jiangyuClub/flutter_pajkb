import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_perfect_model.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

class JKBFloorPerfectBigCard extends StatelessWidget {
  BigImgResponse _bigModel;

  JKBFloorPerfectBigCard(this._bigModel);

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: JKBAppTheme.norTheme.canvasColor,
        margin: EdgeInsets.only(left: 15.px, right: 15.px),
        child: Container(
          padding: EdgeInsets.only(left: 10.px, bottom: 10.px),
          child: Column(
            children: [
              buildHeader(),
              buildFooter(),
            ],
          ),
        )
    );
  }

  //头部
  Widget buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeaderLeft(),
        ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(4.px)),
            child: Image.network(_bigModel.imgUrl!, height: 80.px,)
        )
      ],
    );
  }

  Widget buildHeaderLeft() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(_bigModel.iconUrl!, width: 20.px, height: 20.px,),
                Text(_bigModel.mainTitle!, style: TextStyle(color: Colors.blue, fontSize: 12.px),)
              ],
            ),
            Text(_bigModel.subTitle!, style: TextStyle(color: Colors.black, fontSize: 17.px),),
            Text(_bigModel.tag!, style: TextStyle(color: Colors.grey, fontSize: 14.px),)
          ],
        ),
      ),
    );
  }


  //尾部
  Widget buildFooter() {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_bigModel.number!, style: TextStyle(fontSize: 20.px),),
              Text("元/年起"),
            ],
          ),
        ),
        buildFooterButton()
      ],
    );
  }

  Widget buildFooterButton() {
    return Container(
      height: 26.px,
      margin: EdgeInsets.only(top: 5.px, right: 10.px),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.red]), // 渐变色
          borderRadius: BorderRadius.circular(13.px)
      ),
      child: ElevatedButton(
        child: Container(
            alignment: Alignment.center,
            child: Text(_bigModel.buttonText!, style: TextStyle(color: Colors.white),)),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            //去掉ElevatedButton原有的颜色
            backgroundColor: MaterialStateProperty.all(Colors.transparent)
        ),
        onPressed: () {},
      ),
    );
  }


}

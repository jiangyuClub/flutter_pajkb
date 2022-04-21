import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_perfect_model.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/size_fit.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

class JKBFloorPerfectSmallCard extends StatelessWidget {
  LittleImgList _smallModel;

  JKBFloorPerfectSmallCard(this._smallModel);
  
  @override
  Widget build(BuildContext context) {
    return  Card(
        color: JKBAppTheme.norTheme.canvasColor,
        margin: EdgeInsets.only(top: 10.px, bottom: 15.px),
        child: Container(
          padding: EdgeInsets.only(left: 10.px, bottom: 10.px),
          width: (JKBSizeFit.screenWidth - 70.px)/2,
          child: Column(
            children: [
              buildHeader(),
              buildFooter(),
            ],
          ),
        )
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(_smallModel.iconUrl!, width: 15.px, height: 15.px,),
              Text(_smallModel.mainTitle!, style: TextStyle(color: Colors.blue, fontSize: 12.px),)
            ],
          ),
          Text(_smallModel.subTitle!, style: TextStyle(color: Colors.black, fontSize: 14.px),),
          Text(_smallModel.tag!, style: TextStyle(color: Colors.grey, fontSize: 12.px),)
        ],
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
              Text(_smallModel.number!, style: TextStyle(fontSize: 14.px),),
              Text("元/年起", style: TextStyle(fontSize: 12.px),),
            ],
          ),
        ),
        buildFooterButton()
      ],
    );
  }

  Widget buildFooterButton() {
    return Container(
      height: 20.px,
      margin: EdgeInsets.only(top: 5.px, right: 5.px),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.red]), // 渐变色
          borderRadius: BorderRadius.circular(10.px)
      ),
      child: ElevatedButton(
        child: Container(
            alignment: Alignment.center,
            child: Text(_smallModel.buttonText!, style: TextStyle(color: Colors.white, fontSize: 12.px),)),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            //去掉ElevatedButton原有的颜色
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.only(left: 10.px, right: 10.px))
        ),
        onPressed: () {},
      ),
    );
  }
  
}

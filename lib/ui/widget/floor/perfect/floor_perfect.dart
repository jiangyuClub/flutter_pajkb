import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_perfect_model.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';
import 'package:flutter_pajkb/ui/widget/floor/floor_bound_card.dart';
import 'package:flutter_pajkb/ui/widget/floor/floor_header.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';
import 'package:flutter_pajkb/ui/widget/floor/perfect/floor_perfect_bigcard.dart';
import 'package:flutter_pajkb/ui/widget/floor/perfect/floor_perfect_smallcard.dart';

/**
 * 完善保障楼层
 * */
class JKBFloorPerfect extends StatefulWidget {
  List<ClassifyList> _perfects = [];
  JKBFloorHeaderModel? _headerModel;
  int _sliderIndex = 0;

  JKBFloorPerfect(this._perfects, this._headerModel);

  @override
  _JKBFloorPerfectState createState() => _JKBFloorPerfectState();
}

class _JKBFloorPerfectState extends State<JKBFloorPerfect> {
  @override
  Widget build(BuildContext context) {
    return buildRoundedCard(
        child: Column(
          children: getPerfectChildren(),
        )
    );
  }

  //获取所有纵向控件
  List<Widget> getPerfectChildren() {
    List<Widget> children = [];
    //标题
    if (widget._headerModel != null) {
      children.add(JKBFloorHeader(widget._headerModel!));
    }
    //滑块
    children.add(buildSlider(widget._perfects));

    //大卡片
    ClassifyList currentModel = widget._perfects[widget._sliderIndex];
    children.add(JKBFloorPerfectBigCard(currentModel.bigImgResponse!));

    //小卡片
    if (currentModel.littleImgList!.length >= 2) {
      Widget smallCards = Container(
        padding: EdgeInsets.only(left: 15.px, right: 15.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            JKBFloorPerfectSmallCard(currentModel.littleImgList![0]),
            JKBFloorPerfectSmallCard(currentModel.littleImgList![1]),
          ],
        ),
      );;
      children.add(smallCards);
    }

    return children;
  }

  //2、创建滑块
  Widget buildSlider(List<ClassifyList> perfects) {
    return Container(
      height: 45.px,
      padding: EdgeInsets.only(top: 8.px, bottom: 5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getSliderItems(perfects),
      ),
    );
  }

  List<Widget> getSliderItems(List<ClassifyList> perfects) {
    List<Widget> items = [];
    for (int i = 0; i<perfects.length; i++) {
      Color titleColor = widget._sliderIndex == i ? Colors.black : Colors.grey;
      //每个滑块
      ClassifyList perfect = perfects[i];
      Widget slider = GestureDetector(
        child: Column(
          children: [
            Text(perfect.classifyName!, style: TextStyle(fontSize: JKBAppTheme.smallFontSize, color: titleColor),),
            SizedBox(height: 5.px,),
            widget._sliderIndex == i ? Container(width: 20.px, height: 3.px, color: Colors.green,) : SizedBox(height: 3.px,)
          ],
        ),
        onTap: () {
          setState(() {
            widget._sliderIndex = i;
          });
        },
      );
      items.add(slider);
    }

    return items;
  }





}

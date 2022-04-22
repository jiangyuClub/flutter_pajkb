import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_hotsale_model.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/size_fit.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';
import 'package:flutter_pajkb/ui/widget/floor/common/floor_bound_card.dart';
import 'package:flutter_pajkb/ui/widget/floor/common/floor_header.dart';
import 'package:flutter_pajkb/ui/widget/floor/hotsale/floor_hotsale_product.dart';
import 'package:flutter_pajkb/ui/widget/scroll_slider.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

/**
 * 热销产品
 * */
class JKBFloorHotSale extends StatefulWidget {
  List<HotSaleList> _hotSales;
  JKBFloorHeaderModel? _headerModel;

  int _sliderIndex = 0;

  JKBFloorHotSale(this._hotSales, this._headerModel);

  @override
  _JKBFloorHotSaleState createState() => _JKBFloorHotSaleState();
}

class _JKBFloorHotSaleState extends State<JKBFloorHotSale> {
  @override
  Widget build(BuildContext context) {
    return buildRoundedCard(
        child: Column(
          children: getChildren(),
        )
    );
  }

  //获取所有纵向控件
  List<Widget> getChildren() {
    List<Widget> children = [];

    HotSaleList currentHotSale = widget._hotSales[widget._sliderIndex];

    //标题
    if (widget._headerModel != null) {
      children.add(JKBFloorHeader(widget._headerModel!));
    }

    //滑块
    List<String> titles = [];
    for (HotSaleList hotSale in widget._hotSales) {
      titles.add(hotSale.classifyName!);
    }
    JKBScrollSlider slider = JKBScrollSlider(
      titles: titles,
      height: 40.px,
      padding:
          EdgeInsets.only(top: 5.px, bottom: 5.px, left: 15.px, right: 15.px),
      sliderIndex: widget._sliderIndex,
      //滑块点击事件回调
      onTap: (int index) {
        setState(() {
          widget._sliderIndex = index;
        });
      },
    );
    children.add(slider);

    //备注
    children.add(buildContent(currentHotSale.mainTitle!));

    //产品信息
    children.add(JKBFloorHotSaleProduct(currentHotSale));

    //推荐理由
    children.add(buildRecommend(currentHotSale.recommondTitle!, currentHotSale.recommondContent!));

    //保代产品按钮
    children.add(buildProductButton());

    return children;
  }

  //1、备注信息
  Widget buildContent(String content) {
    return Container(
      margin: EdgeInsets.only(left: 15.px, right: 15.px, bottom: 15.px),
      padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 10.px),
      decoration: BoxDecoration(
          color: JKBAppTheme.norTheme.canvasColor,
          borderRadius: BorderRadius.circular(4.px)
      ),
      child: Text(content),
    );
  }

  //推荐理由
  Widget buildRecommend(String title, String content) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.px, vertical: 10.px),
      padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
      color: JKBAppTheme.norTheme.canvasColor,
      child: Row(
        children: [
          Text(title, style: TextStyle(fontSize: 14.px),),
          SizedBox(width: 5.px,),
          Text(content, style: TextStyle(fontSize: 14.px, color: Colors.grey),),
        ],
      ),
    );
  }

  //保险产品按钮
  Widget buildProductButton() {
    return Container(
      margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 10.px, bottom: 15.px),
      width: JKBSizeFit.screenWidth - 60.px,
      height: 40.px,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.px),
          border: Border.all(
            color: Colors.orange,
            width: 1.px
          )
      ),
      child: Text("保代产品列表", style: TextStyle(fontSize: 14.px, color: Colors.orange), textAlign: TextAlign.center,),
    );
  }

}

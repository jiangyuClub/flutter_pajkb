import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_product_model.dart';
import 'package:flutter_pajkb/ui/widget/floor/common/floor_bound_card.dart';
import 'package:flutter_pajkb/ui/widget/floor/common/floor_header.dart';
import 'package:flutter_pajkb/ui/widget/scroll_slider.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

class JKBFloorProduct extends StatefulWidget {
  List<ProductList> _products;
  JKBFloorHeaderModel? _headerModel;
  int _sliderIndex = 0;
  
  JKBFloorProduct(this._products, this._headerModel);

  @override
  State<JKBFloorProduct> createState() => _JKBFloorProductState();
}

class _JKBFloorProductState extends State<JKBFloorProduct> {
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

//    ProductList currentProduct = widget._products[widget._sliderIndex];

    //标题
    if (widget._headerModel != null) {
      children.add(JKBFloorHeader(widget._headerModel!));
    }

    //滑块
    List<String> titles = [];
    for (ProductList hotSale in widget._products) {
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
    
    //产品信息
    children.add(buildProduct());


    return children;
  }
  
  Widget buildProduct() {
    return Container(
      height: 120.px,
      child: ListView.builder(
//          shrinkWrap: true,
//          physics: NeverScrollableScrollPhysics(),
//        padding: EdgeInsets.only(top: 15.px),
          scrollDirection: Axis.horizontal,
          itemCount: widget._products.length,
          itemBuilder: (BuildContext context, int index) {
            ProductList currentProduct = widget._products[index];
            return Container(
              margin: EdgeInsets.only(left: 10.px, right: 10.px, top: 10.px, bottom: 15.px),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4.px)
              ),
              child: Image.network(currentProduct.backImgUrl!, height: 100.px,),
            );
          }
      ),
    );
  }

}

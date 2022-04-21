import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_hotsale_model.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';

class JKBFloorHotSaleProduct extends StatelessWidget {
  HotSaleList _productModel;

  JKBFloorHotSaleProduct(this._productModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.px),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(4.px),
              child: Image.network(_productModel.imgUrl!, fit: BoxFit.cover, width: 80.px, height: 80.px,)
          ),
          SizedBox(width: 10.px,),
          buildInfo()
        ],
      ),
    );
  }

  Widget buildInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_productModel.title!, style: TextStyle(fontSize: JKBAppTheme.smallFontSize, fontWeight: FontWeight.bold),),
          Text(_productModel.subTitle!, style: TextStyle(fontSize: JKBAppTheme.bodyFontSize, color: Colors.grey),),
          SizedBox(height: 5.px,),
          Row(
            children: [
              buildTag("标签1"),
              SizedBox(width: 5.px,),
              buildTag("标签2"),
            ],
          ),
          SizedBox(height: 5.px,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${_productModel.number!}", style: TextStyle(fontSize: 18.px),),
              Text(_productModel.unit!),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTag(String tag) {
    return Container(
        width: 35.px,
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(4.px)
        ),
        child: Text(tag, style: TextStyle(fontSize: 10.px), textAlign: TextAlign.center,)
    );
  }

}

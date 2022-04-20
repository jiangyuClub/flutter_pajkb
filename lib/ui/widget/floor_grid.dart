import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_grid_model.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';

/*
* 网格楼层
* */
class JKBFloorGrid extends StatelessWidget {
  List<FastModelList> _grids = [];

  JKBFloorGrid(this._grids);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10.px),
      //圆角
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
      child: GridView.builder(
          //解决滚动冲突
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 15.px),
          itemCount: _grids.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 80.px
          ),
          itemBuilder: (ctx, index) {
            return buildGridItem(_grids[index]);
          }
      ),
    );
  }

  Widget buildGridItem(FastModelList item) {
    return Container(
//      color: Colors.red,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.px),
              child: Image.network(item.imgUrl!, fit: BoxFit.cover, width: 40.px, height: 40.px,)
          ),
          Text(item.mainTitle!, style: TextStyle(fontSize: JKBAppTheme.bodyFontSize),)
        ],
      ),
    );
  }
  
}

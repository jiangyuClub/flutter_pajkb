import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';

/**
 * 楼层标题
 * */
class JKBFloorHeader extends StatelessWidget {
  JKBFloorHeaderModel? _headerModel;

  JKBFloorHeader(this._headerModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.only(left: 15.px, top: 10.px),
            child: Text(_headerModel!.floorTitle!, style: TextStyle(fontSize: JKBAppTheme.normalFontSize),)
        )
      ],
    );
  }
}

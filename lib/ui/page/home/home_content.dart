import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_banner_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_config.dart';
import 'package:flutter_pajkb/ui/widget/floor_banner.dart';

class JKBHomeContent extends StatelessWidget {
  List _floorModels = [];

  JKBHomeContent(this._floorModels);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _floorModels.length,
        itemBuilder: (BuildContext context, int index) {
        return getFloor(index);
        }
    );
  }

  /**
   * 首页楼层分发
   * */
  Widget getFloor(int index) {
    JKBFloorBaseModel floorModel = _floorModels[index] as JKBFloorBaseModel;
    switch(floorModel.templateId) {
      case JKBFloorConfig.bannerId:
        {
          JKBFloorBannerModel bannerModel = floorModel as JKBFloorBannerModel;
          List<JKBFloorBannerItem> banners = bannerModel.dataResponse!.bannerModelList as List<JKBFloorBannerItem>;
          return JKBFloorBanner(banners: banners);
        }
        break;
      case JKBFloorConfig.gridId:
        {

        }
        break;

    }
    return Text("data");
  }

/**
 *
 * */
}


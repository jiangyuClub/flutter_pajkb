import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

/**
 * banner楼层自己写的解析model
 * */
class JKBFloorBannerModel {
  late int templateId;
  int? index;
  JKBFloorHeaderModel? headerResponse;

  late JKBFloorResponseModel dataResponse;

  JKBFloorBannerModel.fromJson(Map<String, dynamic> json) {
    templateId = json['templateId'];
    index = json['index'];
    if (json['headerResponse'] != null) {
      headerResponse = JKBFloorHeaderModel.fromJson(json['headerResponse']);
    }
    dataResponse = JKBFloorResponseModel.fromJson(json['dataResponse']);
  }
}

class JKBFloorResponseModel {
  String? floorBackImage;
  String? floorBackColor;
  List? bannerModelList;

  JKBFloorResponseModel.fromJson(Map<String, dynamic> json) {
    floorBackImage = json['floorBackImage'];
    floorBackColor = json['floorBackColor'];

    List<JKBFloorBannerItem> banners = [];
    final resBanners = json['bannerModelList'];
    for (var item in resBanners) {
      var banner = JKBFloorBannerItem.fromJson(item);
      banners.add(banner);
    }
    bannerModelList = banners;
  }

}

class JKBFloorBannerItem {
  String? imgUrl;
  String? router;

  JKBFloorBannerItem.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    router = json['router'];
  }
}
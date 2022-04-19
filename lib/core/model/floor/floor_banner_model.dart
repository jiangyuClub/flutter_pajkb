import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

/**
 * banner楼层自己写的解析model
 * */
class JKBFloorBannerModel extends JKBFloorBaseModel {

  late JKBFloorResponseModel? dataResponse;

  JKBFloorBannerModel({
    this.dataResponse,
    int? templateId,
    int? index,
    JKBFloorHeaderModel? headerResponse,
  }): super(templateId, index, headerResponse);

  factory JKBFloorBannerModel.fromJson(Map<String, dynamic> json) {
    return JKBFloorBannerModel(
      templateId: json['templateId'],
      index: json['index'],
      headerResponse: json['headerResponse'] == Null ? JKBFloorHeaderModel.fromJson(json['headerResponse']) : null,
      dataResponse: JKBFloorResponseModel.fromJson(json['dataResponse']),
    );
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
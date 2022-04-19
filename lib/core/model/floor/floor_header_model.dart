
/**
 * 楼层通用标题model
 * */
class JKBFloorHeaderModel {
  String? floorTitle;
  String? floorBackImage;
  String? floorBackColor;
  String? midlineColor;

  JKBFloorHeaderModel({this.floorTitle, this.floorBackImage, this.floorBackColor, this.midlineColor});

  JKBFloorHeaderModel.fromJson(Map<String, dynamic> json) {
    floorTitle = json['floorTitle'];
    floorBackImage = json['floorBackImage'];
    floorBackColor = json['floorBackColor'];
    midlineColor = json['midlineColor'];
  }
}

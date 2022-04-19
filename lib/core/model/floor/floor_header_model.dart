
/**
 * 楼层通用标题model
 * */
class JKBFloorHeaderModel {
  String? floorTitle;
  String? floorBackImage;
  String? floorBackColor;
  String? midlineColor;

  JKBFloorHeaderModel({this.floorTitle, this.floorBackImage, this.floorBackColor, this.midlineColor});

  factory JKBFloorHeaderModel.fromJson(Map<String, dynamic> json) {
    return JKBFloorHeaderModel(
      floorTitle: json['floorTitle'],
      floorBackImage: json['floorBackImage'],
      floorBackColor: json['floorBackColor'],
      midlineColor: json['midlineColor'],
    );
  }
}

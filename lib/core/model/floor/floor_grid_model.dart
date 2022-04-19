// To parse this JSON data, do
//
//     final JKBFloorGridModel = fromJson(jsonString);

import 'dart:convert';

/**
 * 网格楼层采用自动生成model，做容错修改
 * from：https://app.quicktype.io
 * */
JKBFloorGridModel fromJson(String str) => JKBFloorGridModel.fromJson(json.decode(str));

String toJson(JKBFloorGridModel data) => json.encode(data.toJson());

class JKBFloorGridModel {
  JKBFloorGridModel({
    this.dataResponse,
    this.templateId,
  });

  DataResponse? dataResponse;
  int? templateId;

  factory JKBFloorGridModel.fromJson(Map<String, dynamic> json) => JKBFloorGridModel(
    dataResponse: DataResponse.fromJson(json["dataResponse"]),
    templateId: json["templateId"],
  );

  Map<String, dynamic> toJson() => {
    "dataResponse": dataResponse?.toJson(),
    "templateId": templateId,
  };
}

class DataResponse {
  DataResponse({
    this.floorBackImage,
    this.floorBackColor,
    this.fastModelList,
  });

  String? floorBackImage;
  String? floorBackColor;
  List<FastModelList>? fastModelList;

  factory DataResponse.fromJson(Map<String, dynamic> json) {

    List<FastModelList>fasts = [];
    for (var item in json["fastModelList"]) {
      if (item != null) {
        fasts.add(FastModelList.fromJson(item));
      }
    }
    return DataResponse(
      floorBackImage: json["floorBackImage"],
      floorBackColor: json["floorBackColor"],
      fastModelList: fasts,
    );
  }

  Map<String, dynamic> toJson() => {
    "floorBackImage": floorBackImage,
    "floorBackColor": floorBackColor,
    "fastModelList": List<dynamic>.from(fastModelList?.map((x) => x.toJson()) as dynamic),
  };
}

class FastModelList {
  FastModelList({
    this.imgUrl,
    this.mainTitle,
  });

  String? imgUrl;
  String? mainTitle;

  factory FastModelList.fromJson(Map<String, dynamic> json) => FastModelList(
    imgUrl: json["imgUrl"],
    mainTitle: json["mainTitle"],
  );

  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
    "mainTitle": mainTitle,
  };
}

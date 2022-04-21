// To parse this JSON data, do
//
//     final JKBFloorPerfectModel = fromJson(jsonString);

import 'dart:convert';

import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

JKBFloorPerfectModel fromJson(String str) => JKBFloorPerfectModel.fromJson(json.decode(str));

String toJson(JKBFloorPerfectModel data) => json.encode(data.toJson());

class JKBFloorPerfectModel extends JKBFloorBaseModel {
  JKBFloorPerfectModel({
    this.dataResponse,
    int? templateId,
    int? index,
    JKBFloorHeaderModel? headerResponse,
  }): super(templateId, index, headerResponse);

  DataResponse? dataResponse;

  factory JKBFloorPerfectModel.fromJson(Map<String, dynamic> json) => JKBFloorPerfectModel(
    dataResponse: DataResponse.fromJson(json["dataResponse"]),
    templateId: json["templateId"],
    headerResponse: JKBFloorHeaderModel.fromJson(json["headerResponse"])
  );

  Map<String, dynamic> toJson() => {
    "dataResponse": dataResponse?.toJson(),
    "templateId": templateId,
    "headerResponse": headerResponse,
  };
}

class DataResponse {
  DataResponse({
    this.classifyList,
  });

  List<ClassifyList>? classifyList;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
    classifyList: List<ClassifyList>.from(json["classifyList"].map((x) => ClassifyList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classifyList": List<dynamic>.from(classifyList?.map((x) => x.toJson()) as dynamic),
  };
}

class ClassifyList {
  ClassifyList({
    this.classifyName,
    this.bigImgResponse,
    this.littleImgList,
  });

  String? classifyName;
  BigImgResponse? bigImgResponse;
  List<LittleImgList>? littleImgList;

  factory ClassifyList.fromJson(Map<String, dynamic> json) => ClassifyList(
    classifyName: json["classifyName"],
    bigImgResponse: BigImgResponse.fromJson(json["bigImgResponse"]),
    littleImgList: List<LittleImgList>.from(json["littleImgList"].map((x) => LittleImgList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classifyName": classifyName,
    "bigImgResponse": bigImgResponse?.toJson(),
    "littleImgList": List<dynamic>.from(littleImgList?.map((x) => x.toJson()) as dynamic),
  };
}

class BigImgResponse {
  BigImgResponse({
    this.subTitle,
    this.imgUrl,
    this.buttonText,
    this.mainTitle,
    this.number,
    this.iconUrl,
    this.tag,
  });

  String? subTitle;
  String? imgUrl;
  String? buttonText;
  String? mainTitle;
  String? number;
  String? iconUrl;
  String? tag;

  factory BigImgResponse.fromJson(Map<String, dynamic> json) => BigImgResponse(
    subTitle: json["subTitle"],
    imgUrl: json["imgUrl"],
    buttonText: json["buttonText"],
    mainTitle: json["mainTitle"],
    number: json["number"],
    iconUrl: json["iconUrl"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "subTitle": subTitle,
    "imgUrl": imgUrl,
    "buttonText": buttonText,
    "mainTitle": mainTitle,
    "number": number,
    "iconUrl": iconUrl,
    "tag": tag,
  };
}

class LittleImgList {
  LittleImgList({
    this.subTitle,
    this.buttonText,
    this.mainTitle,
    this.number,
    this.iconUrl,
    this.loginCondition,
    this.tag,
  });

  String? subTitle;
  String? buttonText;
  String? mainTitle;
  String? number;
  String? iconUrl;
  int? loginCondition;
  String? tag;

  factory LittleImgList.fromJson(Map<String, dynamic> json) => LittleImgList(
    subTitle: json["subTitle"],
    buttonText: json["buttonText"],
    mainTitle: json["mainTitle"],
    number: json["number"],
    iconUrl: json["iconUrl"],
    loginCondition: json["loginCondition"] == null ? null : json["loginCondition"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "subTitle": subTitle,
    "buttonText": buttonText,
    "mainTitle": mainTitle,
    "number": number,
    "iconUrl": iconUrl,
    "loginCondition": loginCondition == null ? null : loginCondition,
    "tag": tag,
  };
}

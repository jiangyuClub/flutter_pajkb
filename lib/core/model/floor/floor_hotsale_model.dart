// To parse this JSON data, do
//
//     final JKBFloorHotSaleModel = fromJson(jsonString);

import 'dart:convert';

import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

JKBFloorHotSaleModel fromJson(String str) => JKBFloorHotSaleModel.fromJson(json.decode(str));

String toJson(JKBFloorHotSaleModel data) => json.encode(data.toJson());

class JKBFloorHotSaleModel extends JKBFloorBaseModel {
  JKBFloorHotSaleModel({
    this.dataResponse,
    int? templateId,
    int? index,
    JKBFloorHeaderModel? headerResponse,
  }): super(templateId, index, headerResponse);

  DataResponse? dataResponse;

  factory JKBFloorHotSaleModel.fromJson(Map<String, dynamic> json) => JKBFloorHotSaleModel(
    templateId: json["templateId"],
    headerResponse: JKBFloorHeaderModel.fromJson(json["headerResponse"]),
    dataResponse: DataResponse.fromJson(json["dataResponse"]),
  );

  Map<String, dynamic> toJson() => {
    "templateId": templateId,
    "dataResponse": dataResponse?.toJson(),
  };
}

class DataResponse {
  DataResponse({
    this.hotSaleList,
  });

  List<HotSaleList>? hotSaleList;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
    hotSaleList: List<HotSaleList>.from(json["hotSaleList"].map((x) => HotSaleList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hotSaleList": List<dynamic>.from(hotSaleList?.map((x) => x.toJson()) as dynamic),
  };
}

class HotSaleList {
  HotSaleList({
    this.classifyName,
    this.mainTitle,
    this.imgUrl,
    this.title,
    this.subTitle,
    this.number,
    this.unit,
    this.recommondTitle,
    this.recommondContent,
  });

  String? classifyName;
  String? mainTitle;
  String? imgUrl;
  String? title;
  String? subTitle;
  int? number;
  String? unit;
  String? recommondTitle;
  String? recommondContent;

  factory HotSaleList.fromJson(Map<String, dynamic> json) => HotSaleList(
    classifyName: json["classifyName"],
    mainTitle: json["mainTitle"],
    imgUrl: json["imgUrl"],
    title: json["title"],
    subTitle: json["subTitle"],
    number: json["number"],
    unit: json["unit"],
    recommondTitle: json["recommondTitle"],
    recommondContent: json["recommondContent"],
  );

  Map<String, dynamic> toJson() => {
    "classifyName": classifyName,
    "mainTitle": mainTitle,
    "imgUrl": imgUrl,
    "title": title,
    "subTitle": subTitle,
    "number": number,
    "unit": unit,
    "recommondTitle": recommondTitle,
    "recommondContent": recommondContent,
  };
}

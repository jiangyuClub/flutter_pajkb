
// To parse this JSON data, do
//
//     final JKBFloorProductModel = fromJson(jsonString);

import 'dart:convert';

import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

JKBFloorProductModel fromJson(String str) => JKBFloorProductModel.fromJson(json.decode(str));

String toJson(JKBFloorProductModel data) => json.encode(data.toJson());

class JKBFloorProductModel extends JKBFloorBaseModel {
  JKBFloorProductModel({
    this.dataResponse,
    int? templateId,
    int? index,
    JKBFloorHeaderModel? headerResponse,
  }): super(templateId, index, headerResponse);

  DataResponse? dataResponse;

  factory JKBFloorProductModel.fromJson(Map<String, dynamic> json) => JKBFloorProductModel(
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
    this.productList,
  });

  List<ProductList>? productList;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
    productList: List<ProductList>.from(json["productList"].map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productList": List<dynamic>.from(productList?.map((x) => x.toJson()) as dynamic),
  };
}

class ProductList {
  ProductList({
    this.classifyName,
    this.backImgUrl,
  });

  String? classifyName;
  String? backImgUrl;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    classifyName: json["classifyName"],
    backImgUrl: json["backImgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "classifyName": classifyName,
    "backImgUrl": backImgUrl,
  };
}

class HeaderResponse {
  HeaderResponse({
    this.floorTitle,
  });

  String? floorTitle;

  factory HeaderResponse.fromJson(Map<String, dynamic> json) => HeaderResponse(
    floorTitle: json["floorTitle"],
  );

  Map<String, dynamic> toJson() => {
    "floorTitle": floorTitle,
  };
}

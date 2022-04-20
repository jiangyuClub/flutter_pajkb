// To parse this JSON data, do
//
//     final JKBFloorEnsureModel = fromJson(jsonString);

import 'dart:convert';

import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

JKBFloorEnsureModel fromJson(String str) => JKBFloorEnsureModel.fromJson(json.decode(str));

String toJson(JKBFloorEnsureModel data) => json.encode(data.toJson());

class JKBFloorEnsureModel extends JKBFloorBaseModel {
  JKBFloorEnsureModel({
    this.dataResponse,
    int? templateId,
    int? index,
    JKBFloorHeaderModel? headerResponse,
  }): super(templateId, index, headerResponse);

  DataResponse? dataResponse;

  factory JKBFloorEnsureModel.fromJson(Map<String, dynamic> json) => JKBFloorEnsureModel(
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
    this.ensureModelList,
  });

  List<EnsureModelList>? ensureModelList;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
    ensureModelList: List<EnsureModelList>.from(json["ensureModelList"].map((x) => EnsureModelList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ensureModelList": List<dynamic>.from(ensureModelList?.map((x) => x.toJson()) as dynamic),
  };
}

class EnsureModelList {
  EnsureModelList({
    this.memberGradeName,
    this.subTitle,
  });

  String? memberGradeName;
  String? subTitle;

  factory EnsureModelList.fromJson(Map<String, dynamic> json) => EnsureModelList(
    memberGradeName: json["memberGradeName"],
    subTitle: json["subTitle"],
  );

  Map<String, dynamic> toJson() => {
    "memberGradeName": memberGradeName,
    "subTitle": subTitle,
  };
}

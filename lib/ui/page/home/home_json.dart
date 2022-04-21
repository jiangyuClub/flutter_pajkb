
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_pajkb/core/model/floor/floor_banner_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_ensure_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_grid_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_perfect_model.dart';

/**
 * 首页json解析类
 * */
class JKBHomeJsonParse {

  //获取首页分类数据
  static Future<List<JKBFloorBaseModel>> getHomeData() async {
    List<JKBFloorBaseModel> resList = [];

    //1、banner解析
    final bannerModel = await JKBHomeJsonParse.getFloorModel(url: "assets/jsons/home/banner.json", serializeFun: (json) {
      return JKBFloorBannerModel.fromJson(json);
    });
    resList.add(bannerModel);

    //2、网格楼层
    final gridModel = await JKBHomeJsonParse.getFloorModel(url: "assets/jsons/home/grid.json", serializeFun: (json) {
      return JKBFloorGridModel.fromJson(json);
    });
    resList.add(gridModel);

    //3、左右两标题
    final ensureModel = await JKBHomeJsonParse.getFloorModel(url: "assets/jsons/home/ensure.json", serializeFun: (json) {
      return JKBFloorEnsureModel.fromJson(json);
    });
    resList.add(ensureModel);

    //4、完善保障
    final perfectModel = await JKBHomeJsonParse.getFloorModel(url: "assets/jsons/home/perfect.json", serializeFun: (json) {
      return JKBFloorPerfectModel.fromJson(json);
    });
    resList.add(perfectModel);


    print("testjiang==${resList.length}");

    return resList;
  }



  /**
   * 楼层model解析，支持所有楼层解析
   * 传入对应楼层的json地址和解析函数
   * */
  static Future<dynamic> getFloorModel({required String url, required dynamic Function(dynamic json) serializeFun}) async {
    //1.加载json文件
    final jsonString = await rootBundle.loadString(url);

    // 2.将jsonString转成Map/List
    final result =  json.decode(jsonString);

//    print("testjiang=$result");

    // 3.将Map中的内容转成一个个对象
    final resultModel = serializeFun(result);

//    print("testjiang2=$resultModel");
    return resultModel;
  }


}
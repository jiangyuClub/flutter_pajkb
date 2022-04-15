
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_pajkb/ui/page/home/model/home_model.dart';

/**
 * 首页json解析类
 * */
class JKBHomeJsonParse {

  //获取首页分类数据
  static Future<JKBHomeModel> getHomeData() async {
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/jsons/home.json");

    // 2.将jsonString转成Map/List
    final result =  json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final resultModel = JKBHomeModel.fromJson(result);
    return resultModel;
  }

}
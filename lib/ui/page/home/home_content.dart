import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_banner_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_base_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_config.dart';
import 'package:flutter_pajkb/core/model/floor/floor_ensure_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_grid_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_hotsale_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_perfect_model.dart';
import 'package:flutter_pajkb/core/model/floor/floor_product_model.dart';
import 'package:flutter_pajkb/ui/widget/floor/floor_banner.dart';
import 'package:flutter_pajkb/ui/widget/floor/floor_ensure.dart';
import 'package:flutter_pajkb/ui/widget/floor/floor_grid.dart';
import 'package:flutter_pajkb/ui/widget/floor/floor_product.dart';
import 'package:flutter_pajkb/ui/widget/floor/hotsale/floor_hotsale.dart';
import 'package:flutter_pajkb/ui/widget/floor/perfect/floor_perfect.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

class JKBHomeContent extends StatelessWidget {
  List _floorModels = [];

  JKBHomeContent(this._floorModels);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 15.px),
        itemCount: _floorModels.length,
        itemBuilder: (BuildContext context, int index) {
        return getFloor(index);
        }
    );
  }

  /**
   * 首页楼层分发
   * */
  Widget getFloor(int index) {
    Widget? floor;
    JKBFloorBaseModel floorModel = _floorModels[index] as JKBFloorBaseModel;
    switch (floorModel.templateId) {
      case JKBFloorConfig.bannerId:{
        JKBFloorBannerModel bannerModel = floorModel as JKBFloorBannerModel;
        List<JKBFloorBannerItem> banners = bannerModel
            .dataResponse!.bannerModelList as List<JKBFloorBannerItem>;
        floor = JKBFloorBanner(banners: banners);
      }
        break;
      case JKBFloorConfig.gridId:{
        JKBFloorGridModel gridModel = floorModel as JKBFloorGridModel;
        List<FastModelList> grids = gridModel.dataResponse!.fastModelList as List<FastModelList>;
        floor = JKBFloorGrid(grids);
      }
        break;
      case JKBFloorConfig.ensureId:{
        JKBFloorEnsureModel ensureModel = floorModel as JKBFloorEnsureModel;
        List<EnsureModelList> ensures = ensureModel.dataResponse!.ensureModelList as List<EnsureModelList>;
        floor = JKBFloorEnsure(ensures);
      }
      break;
      case JKBFloorConfig.perfectId:{
        JKBFloorPerfectModel perfectModel = floorModel as JKBFloorPerfectModel;
        List<ClassifyList> perfects = perfectModel.dataResponse!.classifyList as List<ClassifyList>;
        floor = JKBFloorPerfect(perfects, perfectModel.headerResponse);
      }
      break;
      case JKBFloorConfig.hotSaleId:{
        JKBFloorHotSaleModel hotSaleModel = floorModel as JKBFloorHotSaleModel;
        List<HotSaleList> hotSales = hotSaleModel.dataResponse!.hotSaleList as List<HotSaleList>;
        floor = JKBFloorHotSale(hotSales, hotSaleModel.headerResponse);
      }
      break;
      case JKBFloorConfig.productId:{
        JKBFloorProductModel productModel = floorModel as JKBFloorProductModel;
        List<ProductList> products = productModel.dataResponse!.productList as List<ProductList>;
        floor = JKBFloorProduct(products, productModel.headerResponse);
      }
      break;
    }
    return floor!=null ? floor : Text("未知楼层");
  }




}


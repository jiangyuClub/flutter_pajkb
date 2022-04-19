
import 'package:flutter_pajkb/core/model/floor/floor_header_model.dart';

class JKBFloorBaseModel {
  int? templateId;
  int? index;
  JKBFloorHeaderModel? headerResponse;

  JKBFloorBaseModel(this.templateId, this.index, this.headerResponse);
}
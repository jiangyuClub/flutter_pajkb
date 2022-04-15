
import 'package:flutter_pajkb/ui/shared/size_fit/size_fit.dart';

/**
 *  像素适配工具类
 * */
extension DoubleFit on double {
  double get px {
    return JKBSizeFit.setPx(this);
  }

  double get rpx {
    return JKBSizeFit.setRpx(this);
  }
}

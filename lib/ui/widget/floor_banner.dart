import 'package:flutter/material.dart';
import 'package:flutter_pajkb/core/model/floor/floor_banner_model.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

/**
 * banner楼层
 * */
class JKBFloorBanner extends StatelessWidget {
  const JKBFloorBanner({
    Key? key,
    required this.banners,
  }) : super(key: key);

  final List<JKBFloorBannerItem> banners;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.px,
      padding: EdgeInsets.only(left: 15.px, right: 15.px),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.px),
        child: Swiper(
          autoplay: true,
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int index) {
            JKBFloorBannerItem item = banners[index];
            return Image.network(
              item.imgUrl!,
              fit: BoxFit.cover,
            );
          },
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              size: 8,
              activeSize: 8,
              color: Color.fromARGB(100, 55, 100, 255),
              activeColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
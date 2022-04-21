import 'package:flutter/material.dart';
import 'package:flutter_pajkb/ui/shared/theme/app_theme.dart';
import 'package:flutter_pajkb/ui/shared/size_fit/int_extension.dart';

/**
 * 可滚动的滑块导航
 * */
class JKBScrollSlider extends StatefulWidget {
  List<String> titles;
  EdgeInsetsGeometry? padding;
  late double height;
  late int sliderIndex;
  void Function(int index) onTap;

  //构造函数可选值
  JKBScrollSlider({
    required this.titles,
    int sliderIndex = 0,
    EdgeInsetsGeometry? padding,
    double height = 35,
    required this.onTap,
  }) {
    this.sliderIndex = sliderIndex;
    this.padding = padding;
    this.height = height;
  }

  @override
  _JKBScrollSliderState createState() => _JKBScrollSliderState();
}


class _JKBScrollSliderState extends State<JKBScrollSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: widget.padding != null ? widget.padding : EdgeInsets.only(left: 15.px, right: 15.px),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.titles.length,
          //间隔
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 25.px,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return buildSliderItem(widget.titles, index);
          }),
    );
  }

  Widget buildSliderItem(List<String> titles, int index) {
    Color titleColor = widget.sliderIndex == index ? Colors.orange : Colors.grey;
    String title = titles[index];

    Widget slider = GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TextStyle(fontSize: JKBAppTheme.smallFontSize, color: titleColor),),
          Container(height: 5.px,),
          widget.sliderIndex == index ? Container(width: 20.px, height: 3.px, color: Colors.green,) : SizedBox(height: 3.px,)
        ],
      ),
      onTap: () {
        setState(() {
          widget.sliderIndex = index;
          widget.onTap(index);
        });
      },
    );
    return slider;
  }
  
}



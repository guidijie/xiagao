import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget{

  /// 轮播图片
  var images;
  /// 组件高度
  double height = 200;
  /// 点击事件
  var onTap;

  // CustomBanner({Key? key}) : super(key: key);
  CustomBanner(this.images, {Key? key, height, onTap}) : super(key: key) {

    if (height != null)
      this.height = height;
    if (onTap != null)
      this.onTap = onTap;
  }


  @override
  State<StatefulWidget> createState() => CustomBannerState();

}

class CustomBannerState extends State<CustomBanner>{
  int _curIndex = 0;
  late PageController _pageController;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _curIndex, //默认在第几个
      viewportFraction: 1, // 占屏幕多少，1为占满整个屏幕
      keepPage: true, //是否保存当前 Page 的状态，如果保存，下次回复保存的那个 page，initialPage被忽略，
      //如果为 false 。下次总是从 initialPage 开始。
    );
    _timer = Timer.periodic(const Duration(seconds: 4), (t) {
      _curIndex++;
      _pageController.animateToPage(
        _curIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    // return _buildPageView();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        // _buildIndicator(),
      ],
    );
  }

  /// 轮播图
  Widget _buildPageView() {
    var length = widget.images.length;
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          if (index == 0) {
            _curIndex = length;
          }
        },
        itemBuilder: (context, index) {
          // return Image.network(
          //   widget.images[index % length],
          //   fit: BoxFit.cover,
          // );
          return GestureDetector(
            child: Image.network(
              widget.images[index % length],
              fit: BoxFit.cover,
            ),
            onTap: () {
              /// index % length 为数组下标
              print(index % length);
            },
          );
        },
      ),
    );
  }

  // /// 轮播图小圆点
  // Widget _buildIndicator() {
  //   var length = widget.images.length;
  //   return Positioned(
  //     bottom: 10,
  //     child: Row(
  //       children: widget.images.map((s) {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 3.0),
  //           child: ClipOval(
  //             child: Container(
  //               width: 8,
  //               height: 8,
  //               color: s == widget.images[_curIndex % length]
  //                   ? Colors.white
  //                   : Colors.grey,
  //             ),
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }
}
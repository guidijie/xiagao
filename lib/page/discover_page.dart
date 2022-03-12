import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'discover/category_page.dart';
import 'home_content.dart';

/// 发现页
class DiscoverPaperPage extends StatefulWidget {
  const DiscoverPaperPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DiscoverPaperPageState();
}

class DiscoverPaperPageState extends State<StatefulWidget> {
  /// 后期从数据库中查询
  final List<String> _tabValues = [
    '关注',
    '分类',
    '专题',
    '咨询',
    '推荐',
  ];

  late TabController _controller;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabValues.length, vsync: ScrollableState());
    _pageController = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 内容背景
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('发现',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          // appBar背景
          backgroundColor: Colors.white,
          centerTitle: true,
          // 去除阴影线
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                onPressed: () {
                  // todo跳转到搜索页面
                  // NavigatorManager.to(VideoSearchPage());
                }),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TabBar(
                  controller: _controller,
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xff9a9a9a),
                  labelStyle: const TextStyle(fontSize: 14),
                  unselectedLabelStyle: const TextStyle(fontSize: 14),
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabValues.map((String label) {
                    return Tab(text: label);
                  }).toList(),
                  onTap: (index) => _pageController.animateToPage(index, duration: kTabScrollDuration, curve: Curves.ease)),
            ),
            Expanded(
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _controller.index = index;
                      });
                    },
                    children: const <Widget>[
                      HomeContent(),
                      CategoryPage(),
                      HomeContent(),
                    ]))
          ],
        )
      );
  }
}

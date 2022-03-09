import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        tabs: _tabValues.map((f) {
          return Text(f);
        }).toList(),
        controller: _controller,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorWeight: 2.0,
        labelStyle: const TextStyle(height: 6, fontSize: 14),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Center(
            child: Text(f),
          );
        }).toList(),
      ),
    );
  }
}
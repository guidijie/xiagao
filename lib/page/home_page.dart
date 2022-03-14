import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiagao/common/list/list_item.dart';
import 'package:xiagao/utils/static_data.dart';

/// 日报页面
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// 列表假数据
  late var listData;

  @override
  void initState() {
    super.initState();
    listData = StaticData.listData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 内容背景
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('日报',
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: _list(),
        )
    );
  }

  /// 获取列表
  Widget _list() {
    return ListItem(listData, isShowBanner: true);
  }

}

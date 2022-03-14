import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xiagao/utils/static_data.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {

  late var data = [];

  late var num = 1;

  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    data = StaticData.listData;
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        //刷新回调方法
        onRefresh: _onRefresh,
        //加载下一页回调
        onLoading: _onLoading,
        header: const MaterialClassicHeader(
            semanticsLabel: 'aaaaaaa',
            semanticsValue: 'bbbbbb'
        ),
        child: MasonryGridView.count(
          itemCount: 20,
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return Container(
              height: (index % 5 + 1) * 100,
              color: Colors.amber,
              child: Text(index.toString()),
            );
          },
        ),
      )
    );
  }


  void _onRefresh() async {
    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    refreshController.loadComplete();
    setState(() {
    });
  }

  @override
  bool get wantKeepAlive => true;
}

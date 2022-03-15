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
    data = StaticData.recommendListData;
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
        // header: const MaterialClassicHeader(
        //     semanticsLabel: 'aaaaaaa',
        //     semanticsValue: 'bbbbbb'
        // ),
        child: MasonryGridView.count(
          itemCount: data.length,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 6,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _imageItem(context, index),
                _contentTextItem(index),
                _infoTextItem(index)
              ],
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

  _imageItem(BuildContext context, int index) {
    //等比缩放图片，防止加载图片拉伸
    var maxWidth = MediaQuery.of(context).size.width / 2;
    var maxHeight = MediaQuery.of(context).size.height / 2;
    // var height = (data.data.content.data.height == 0
    //     ? maxHeight / 2
    //     : item.data.content.data.height) *
    //     (maxWidth / item.data.content.data.width);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            child: Image.asset(data[index]['viewImageUrl'], height: data[index]['type'] == 'video' ? 300 : 120, fit: BoxFit.cover,),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: Offstage(
                offstage: data[index] != null,
                child: Icon(
                  data[index]['type'] == 'video'
                      ? Icons.play_circle_outline
                      : Icons.photo_library,
                  color: Colors.white,
                  size: 18,
                ),
              ))
        ],
      ),
    );
  }

  _contentTextItem(int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: Text(
        data[index]['title'],
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  _infoTextItem(int index) {
    return PhysicalModel(
      //类似于ClipRRect
      color: Colors.white,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
      clipBehavior: Clip.hardEdge,
      elevation: 1.0,
      shadowColor: Colors.grey,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipOval(
                  // 作者头像
                  child: Image.asset(
                    data[index]['authorImageUrl'],
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 80,
                  child: Text(
                    data[index]['authorName']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            Row(
              children: const <Widget>[
                Icon(
                  Icons.thumb_up,
                  size: 14,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    '1638',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

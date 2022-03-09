import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiagao/common/banner/custom_banner.dart';
import 'package:xiagao/common/banner/list_item.dart';

/// 日报页面
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// 列表假数据
  var listData = [
    {
      'type': '旅行',
      'title': '浪漫延时摄影，三星S21镜头下的旧金山',
      'dataFrom': '全球旅行视频精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_1.png',
      'authorImageUrl': 'assets/images/pikaqiu.jpg',
      'timeLength': '03.21'
    },
    {
      'type': '广告',
      'title': '慢动作新玩法，雅虎超喜感运动广告',
      'dataFrom': '全球广告精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_2.png',
      'authorImageUrl': 'assets/images/nv.jpg',
      'timeLength': '03.59'
    },
    {
      'type': '创意',
      'title': '科幻创意短片，未来 [新人类] 工厂',
      'dataFrom': '全球创意视频精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_3.png',
      'authorImageUrl': 'assets/images/pikaqiu.jpg',
      'timeLength': '12.01'
    },
    {
      'type': '动画',
      'title': '阳光色彩动画MV，陷入 [冰淇淋岛]',
      'dataFrom': '全球动画精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_4.png',
      'authorImageUrl': 'assets/images/pikaqiu.jpg',
      'timeLength': '05.12'
    },
    {
      'type': '音乐',
      'title': '俄罗斯嘻哈MV，压抑黑暗 [人性世界]',
      'dataFrom': '全球音乐视频精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_5.png',
      'authorImageUrl': 'assets/images/nv.jpg',
      'timeLength': '11.20'
    },
    {
      'type': '记录',
      'title': '哲思记录片，你将听到最好的心理健康建议',
      'dataFrom': '全球记录精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_6.png',
      'authorImageUrl': 'assets/images/nv.jpg',
      'timeLength': '06.32'
    },
    {
      'type': '记录',
      'title': '哲思记录片，你将听到最好的心理健康建议',
      'dataFrom': '全球记录精选',
      'viewImageUrl': 'assets/images/dailyPaper/daily_paper_7.png',
      'authorImageUrl': 'assets/images/pikaqiu.jpg',
      'timeLength': '06.32'
    },
  ];

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
        // body: Column(
        //   children: [
        //     _shufflingFigure(),
        //     Expanded(
        //       child: _list(),
        //     ),
        //   ],
        // ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: _list(),
        )
    );
  }

  /// 获取列表
  Widget _list() {
    return ListItem(listData, isShowBanner: true);
  }

}

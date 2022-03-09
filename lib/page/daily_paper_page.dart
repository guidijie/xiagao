import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiagao/common/banner/custom_banner.dart';
import 'package:xiagao/common/banner/list_item.dart';

/// 日报
class DailyPaper extends StatefulWidget {
  const DailyPaper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DailyPaperState();
}

class DailyPaperState extends State<DailyPaper> {

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
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(title: Text('aaaaaaa')),
          // 内容区域
          body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 45, 15, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30, right: 0),
                      child: const Text('日报',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    flex: 1),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                )
              ],
            ),
            // _shufflingFigure(),
            Expanded(
              child: _list(),
            ),
          ],
        ),
      )),
    );
  }

  /// 获取列表
  Widget _list() {
    return ListItem(listData);
  }


  /// 轮播图
  Widget _shufflingFigure() {
    List<String> images = [
      'https://images.unsplash.com/photo-1477346611705-65d1883cee1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1498550744921-75f79806b8a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ];
    return CustomBanner(images);
  }
}

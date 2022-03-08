import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            // 视频url
                            image: AssetImage(listData[index]['viewImageUrl']!),
                            fit: BoxFit.fitWidth),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(4))),
                    width: double.maxFinite,
                    height: 200,
                    child: const Text(''),
                  ),
                  Positioned(
                      child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0x8DDEDEDE),
                            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          width: 45,
                          height: 45,
                          // 视频类型
                          child: Text(listData[index]['type']!,
                              style: const TextStyle(fontSize: 12, color: Colors.white),
                              textAlign: TextAlign.center)),
                      left: 15,
                      top: 10),
                  Positioned(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0x61000000),
                          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        // color: const Color(0xffb3b3b3),
                        // child:  const Text('05:20', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center)
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxWidth: 200.0, minWidth: 40, minHeight: 20),
                            // 视频时间
                            child: Text(
                                listData[index]['timeLength']!,
                                style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                                softWrap: true,
                                textAlign: TextAlign.center
                            )
                        )
                    ),
                    bottom: 15,
                    right: 20,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    ClipOval(
                      // 作者头像
                      child: Image.asset(
                        listData[index]['authorImageUrl']!,
                        width: 45,
                        height: 45,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 视频标题
                              Text(listData[index]['title']!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 2),
                              // 视频来源
                              Text(listData[index]['dataFrom']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        flex: 1),
                    const Icon(Icons.share, color: Colors.grey, size: 25)
                  ],
                ),
              ),
              const Divider(color: Color(0xffe8e9eb), thickness: 0.5),
              const SizedBox(height: 5),
            ],
          );
        });
  }
}

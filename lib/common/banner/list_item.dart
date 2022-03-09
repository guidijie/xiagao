import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_banner.dart';

class ListItem extends StatefulWidget {

  /// 数据源
  var listData;
  bool isShowBanner;

  ListItem(this.listData, {Key? key, this.isShowBanner = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListItemState();

}
class ListItemState extends State<ListItem> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (widget.isShowBanner && index == 0)
                _shufflingFigure(),
              Stack(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                          // 视频url
                            image: AssetImage(widget.listData[index]['viewImageUrl']!),
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
                            color: Color(0x99E2D6D6),
                            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0)),
                          ),
                          width: 45,
                          height: 45,
                          // 视频类型
                          child: Text(widget.listData[index]['type']!,
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
                                widget.listData[index]['timeLength']!,
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
                        widget.listData[index]['authorImageUrl']!,
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
                              Text(widget.listData[index]['title']!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 2),
                              // 视频来源
                              Text(widget.listData[index]['dataFrom']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
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
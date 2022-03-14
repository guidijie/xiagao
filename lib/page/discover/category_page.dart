import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiagao/utils/static_data.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {

  late var data = [];

  @override
  void initState() {
    super.initState();
    data = StaticData.listData;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
        child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Container(
                decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: AssetImage(data[index]['viewImageUrl']!),
                        fit: BoxFit.cover
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(4))
                ),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text('#' + data[index]['type']!, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              );
            }
        )
    );
    // return Padding(
    //   padding: const EdgeInsets.all(5),
    //   child: Wrap(
    //     spacing: 2, //主轴上子控件的间距
    //     runSpacing: 5, //交叉轴上子控件之间的间距
    //     children: boxs(), //要显示的子控件集合
    //   ),
    // );
  }

  /// 一个渐变颜色的正方形集合
  List<Widget> boxs() => List.generate(10, (index) {
        return Container(
          width: 150,
          height: 150,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orangeAccent,
              Colors.orange,
              Colors.deepOrange
            ]),
          ),
          child: Text(
            "${index}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      });

  @override
  bool get wantKeepAlive => true;
}

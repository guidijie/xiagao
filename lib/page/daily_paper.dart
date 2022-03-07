import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyPaper extends StatelessWidget {

  const DailyPaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Container为一个容器
      child: Container(
        child: const Text(
          '内容区域', style: TextStyle(fontSize: 19, color: Colors.blue),
        ),
        padding: const EdgeInsets.all(10),
        // 元素居中
        alignment: Alignment.center,
      ),
    );
  }
}
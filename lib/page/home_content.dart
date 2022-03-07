import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {

  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Container为一个容器
      child: Container(
        child: const Text(
          '内容区域', style: TextStyle(fontSize: 19, color: Colors.blue),
        ),
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(16)
          )
        ),
        padding: const EdgeInsets.all(10),
        // 元素居中
        alignment: Alignment.center,
      ),
    );
  }
}
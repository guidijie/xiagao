import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiagao/page/daily_paper.dart';
import 'package:xiagao/page/home_content.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<Index> {
  int _currentIndex = 0;

  // 导航页
  final _pages = <Widget>[
    const DailyPaper(),
    const HomeContent(),
    const HomeContent(),
    const HomeContent()
  ];

  // 底部导航栏要显示的所有子项
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: '日报'),
    const BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
    const BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: '热门'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    // MaterialApp 为根组件
    return MaterialApp(
      // 用来定义主题颜色
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // 内容区域
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: bottomNavBarItems,
            onTap: (index) => _changePage(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
        ),
      ),
    );
  }

  _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

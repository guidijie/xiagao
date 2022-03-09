import 'package:flutter/material.dart';
import 'package:xiagao/page/discover_page.dart';
import 'package:xiagao/page/home_page.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[HomePage(), DiscoverPaperPage(), DiscoverPaperPage(), DiscoverPaperPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.jumpToPage(index); //跳转到指定页面
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed, //显示标题
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '日报'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
            BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: '热门'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
          ]),
    );
  }

  // _bottomItem(String title, String normalIcon, String selectIcon, int index) {
  //   return BottomNavigationBarItem(
  //     icon: Image.asset(normalIcon, width: 24, height: 24),
  //     activeIcon: Image.asset(selectIcon, width: 24, height: 24),
  //     title: Padding(
  //         padding: EdgeInsets.only(top: 5),
  //         child: Text(title,
  //             style: TextStyle(
  //                 color:
  //                     Color(_currentIndex == index ? 0xff000000 : 0xff9a9a9a),
  //                 fontSize: 14))),
  //   );
  // }
}

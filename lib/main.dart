import 'package:flutter/material.dart';
import 'package:xiagao/page/index.dart';

import 'navigation/tab_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Index();
  }
}

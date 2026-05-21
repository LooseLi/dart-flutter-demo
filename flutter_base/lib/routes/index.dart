// 管理路由
import 'package:flutter/material.dart';
import 'package:flutter_base/pages/home/index.dart';
import 'package:flutter_base/pages/login/index.dart';

// 返回App根级组件
Widget getRootWidget() {
  return MaterialApp(initialRoute: '/', routes: getRootRoutes());
}

// 返回路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {'/': (context) => HomePage(), '/login': (context) => LoginPage()};
}

import 'package:flutter/material.dart';
import 'package:flutter_base/api/user.dart';
import 'package:flutter_base/pages/cart/index.dart';
import 'package:flutter_base/pages/category/index.dart';
import 'package:flutter_base/pages/home/index.dart';
import 'package:flutter_base/pages/mine/index.dart';
import 'package:flutter_base/stores/token.dart';
import 'package:flutter_base/stores/user.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      'icon': 'lib/assets/icon-1.png',
      'active_icon': 'lib/assets/icon-2.png',
      'text': '首页',
    },
    {
      'icon': 'lib/assets/icon-3.png',
      'active_icon': 'lib/assets/icon-4.png',
      'text': '分类',
    },
    {
      'icon': 'lib/assets/icon-5.png',
      'active_icon': 'lib/assets/icon-6.png',
      'text': '购物车',
    },
    {
      'icon': 'lib/assets/icon-7.png',
      'active_icon': 'lib/assets/icon-8.png',
      'text': '我的',
    },
  ];

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]['active_icon']!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]['text']!,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _initUser();
  }

  final User _userController = Get.put(User());

  _initUser() async {
    await token.init();
    if (token.getToken().isNotEmpty) {
      _userController.updateUserInfo(await getUserInfoAPI());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

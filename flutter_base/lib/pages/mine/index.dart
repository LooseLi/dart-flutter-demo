import 'package:flutter/material.dart';
import 'package:flutter_base/api/mine.dart';
import 'package:flutter_base/components/home/TheMoreList.dart';
import 'package:flutter_base/components/mine/TheGuess.dart';
import 'package:flutter_base/models/home.dart';
import 'package:flutter_base/models/user.dart';
import 'package:flutter_base/stores/token.dart';
import 'package:flutter_base/stores/user.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  State<MineView> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  final User _userController = Get.find();

  final List<GoodDetailItem> _list = [];
  final Map<String, dynamic> _params = {'page': 1, 'pageSize': 10};

  @override
  void initState() {
    super.initState();
    _getGuessList();
    _registerEvent();
  }

  bool isLoading = false;
  bool hasMore = true;
  void _getGuessList() async {
    if (isLoading || !hasMore) {
      return;
    }
    isLoading = true;
    final res = await getGuessListAPI(_params);
    isLoading = false;
    _list.addAll(res.items);
    if (_params['page'] >= res.pages) {
      hasMore = false;
      return;
    }
    _params['page']++;
    if (mounted) {
      setState(() {});
    }
  }

  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.pixels <=
          _controller.position.maxScrollExtent - 50) {
        _getGuessList();
      }
    });
  }

  Widget _getLogout() {
    return _userController.user.value.id.isNotEmpty
        ? GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('提示'),
                    content: Text('确认要退出吗？'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('取消'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await token.removeToken();
                          _userController.updateUserInfo(UserInfo.fromJSON({}));

                          if (!context.mounted) {
                            return;
                          }

                          Navigator.pop(context);
                        },
                        child: Text('确认'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('退出登录', textAlign: TextAlign.end),
          )
        : Text('');
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Row(
        children: [
          Obx(() {
            return CircleAvatar(
              radius: 26,
              backgroundImage: _userController.user.value.avatar.isNotEmpty
                  ? NetworkImage(_userController.user.value.avatar)
                  : AssetImage('lib/assets/icon-test.jpeg'),
              backgroundColor: Colors.white,
            );
          }),
          SizedBox(width: 10),
          Obx(() {
            return GestureDetector(
              onTap: () {
                if (_userController.user.value.id.isEmpty) {
                  Navigator.pushNamed(context, '/login');
                }
              },
              child: Text(
                _userController.user.value.id.isNotEmpty
                    ? _userController.user.value.account
                    : '点击登录',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }),
          SizedBox(width: 30),
          Obx(() {
            return _getLogout();
          }),
        ],
      ),
    );
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverToBoxAdapter(child: _buildHeader()),
        SliverPersistentHeader(delegate: TheGuess(), pinned: true),
        TheMoreList(recommendList: _list),
      ],
    );
  }
}

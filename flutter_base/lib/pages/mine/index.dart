import 'package:flutter/material.dart';
import 'package:flutter_base/api/mine.dart';
import 'package:flutter_base/components/home/TheMoreList.dart';
import 'package:flutter_base/components/mine/TheGuess.dart';
import 'package:flutter_base/models/home.dart';
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
  final User _userController = Get.put(User());

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

  Widget _buildHeader() {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          if (_userController.user.value.id.isEmpty) {
            Navigator.pushNamed(context, '/login');
          }
        },
        child: Container(
          width: double.infinity,
          height: 200,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            _userController.user.value.id.isNotEmpty
                ? _userController.user.value.account
                : '点击登录',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    });
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

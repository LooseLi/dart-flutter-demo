import 'package:flutter/material.dart';
import 'package:flutter_base/api/mine.dart';
import 'package:flutter_base/components/home/TheMoreList.dart';
import 'package:flutter_base/components/mine/TheGuess.dart';
import 'package:flutter_base/models/home.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  State<MineView> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
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
    return Container(width: double.infinity, height: 200, color: Colors.blue);
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

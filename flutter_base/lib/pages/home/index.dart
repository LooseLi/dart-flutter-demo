import 'package:flutter/material.dart';
import 'package:flutter_base/api/home.dart';
import 'package:flutter_base/components/home/TheCategory.dart';
import 'package:flutter_base/components/home/TheHot.dart';
import 'package:flutter_base/components/home/TheMoreList.dart';
import 'package:flutter_base/components/home/TheSlider.dart';
import 'package:flutter_base/components/home/TheSuggestion.dart';
import 'package:flutter_base/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: TheSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: TheCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: TheSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: TheHot()),
              SizedBox(width: 10),
              Expanded(child: TheHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      TheMoreList(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
  }

  void _getBannerList() async {
    final res = await getBannerListAPI();
    _bannerList = res;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}

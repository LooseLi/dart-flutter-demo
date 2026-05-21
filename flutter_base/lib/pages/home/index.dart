import 'package:flutter/material.dart';
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
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: '1',
      imgUrl: 'https://img.beingfine.cn/Channel/i_09543310006_opt.png',
    ),
    BannerItem(
      id: '2',
      imgUrl: 'https://img.beingfine.cn/Channel/i_09543410007_opt.png',
    ),
    BannerItem(
      id: '3',
      imgUrl: 'https://img.beingfine.cn/Channel/i_09542910004_opt.png',
    ),
  ];

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
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_base/api/home.dart';
import 'package:flutter_base/components/home/TheCategory.dart';
import 'package:flutter_base/components/home/TheHot.dart';
import 'package:flutter_base/components/home/TheMoreList.dart';
import 'package:flutter_base/components/home/TheSlider.dart';
import 'package:flutter_base/components/home/TheSuggestion.dart';
import 'package:flutter_base/utils/ToastUtils.dart';
import 'package:flutter_base/models/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  HotRecommendResult _hotRecommendResult = HotRecommendResult(
    id: '',
    title: '',
    subTypes: [],
  );
  HotRecommendResult _inVogueResult = HotRecommendResult(
    id: '',
    title: '',
    subTypes: [],
  );
  HotRecommendResult _oneStopResult = HotRecommendResult(
    id: '',
    title: '',
    subTypes: [],
  );
  List<GoodDetailItem> _recommendList = [];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: TheSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: TheCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: TheSuggestion(hotRecommendResult: _hotRecommendResult),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: TheHot(result: _inVogueResult, type: 'hot'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TheHot(result: _oneStopResult, type: 'step'),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      TheMoreList(recommendList: _recommendList),
    ];
  }

  @override
  void initState() {
    super.initState();

    // _getBannerList();
    // _getCategoryList();
    // _getProductList();
    // _getInVogueList();
    // _getOneStopList();
    // _getRecommendList();

    // 微任务
    Future.microtask(() {
      _paddingTop = 60;
      _key.currentState?.show();
    });

    _registerEvent();
  }

  // 监听滚动到底部的事件
  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.pixels >=
          (_controller.position.maxScrollExtent - 50)) {
        _getRecommendList(); // 无限滚动
      }
    });
  }

  Future<void> _getBannerList() async {
    final res = await getBannerListAPI();
    _bannerList = res;
  }

  Future<void> _getCategoryList() async {
    final res = await getCategoryListAPI();
    _categoryList = res;
  }

  Future<void> _getProductList() async {
    _hotRecommendResult = await getProductListAPI();
  }

  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  }

  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }

  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true;
    int limit = _page * 10;
    _recommendList = await getRecommendListAPI({'limit': limit});
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
    if (_recommendList.length < limit) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    ToastUtils.showToast(context, '刷新数据成功');
    _paddingTop = 0;
    if (mounted) {
      setState(() {});
    }
  }

  final ScrollController _controller = ScrollController();

  // GlobalKey是一个方法，可以创建一个key，并绑定到 widget 组件上，可以操作 widget 组件
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  double _paddingTop = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(microseconds: 300),
        child: CustomScrollView(
          controller: _controller,
          slivers: _getScrollChildren(),
        ),
      ),
    );
  }
}

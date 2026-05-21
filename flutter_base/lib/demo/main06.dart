import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// GridView
class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CustomScrollView')),
        body: CustomScrollView(
          slivers: [
            // SliverToBoxAdapter包裹普通widget
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            '轮播图${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(7, (index) {
                          return GestureDetector(
                            onTap: () {
                              // _controller.jumpToPage(index);
                              _controller.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.red
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            // 粘性吸顶分类
            SliverPersistentHeader(delegate: _Sticky(), pinned: true),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList.separated(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Sticky extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('${index + 1}', style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 80; // 最大展开高度

  @override
  double get minExtent => 40; // 最小折叠高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // 不需要重建
  }
}

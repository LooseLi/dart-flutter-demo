import 'package:flutter/material.dart';
import 'package:flutter_base/viewmodels/home.dart';

class TheSuggestion extends StatefulWidget {
  final HotRecommendResult hotRecommendResult;
  const TheSuggestion({super.key, required this.hotRecommendResult});

  @override
  State<TheSuggestion> createState() => _TheSuggestionState();
}

class _TheSuggestionState extends State<TheSuggestion> {
  List<HotGoodsItem> _getDisplayItems() {
    if (widget.hotRecommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.hotRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7), fontSize: 18),
        ),
        SizedBox(width: 10),
        Text(
          '精选省攻略',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7), fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('lib/assets/icon-test.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<HotGoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'lib/assets/icon-test.jpeg',
                  width: 100,
                  height: 100,
                );
              },
              list[index].picture,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            child: Text(
              '¥${list[index].price}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

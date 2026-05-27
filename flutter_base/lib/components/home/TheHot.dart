import 'package:flutter/material.dart';
import 'package:flutter_base/viewmodels/home.dart';

class TheHot extends StatefulWidget {
  final HotRecommendResult result;
  final String type;
  const TheHot({super.key, required this.result, required this.type});

  @override
  State<TheHot> createState() => _TheHotState();
}

class _TheHotState extends State<TheHot> {
  List<HotGoodsItem> _getItems() {
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == 'step' ? '一站买全' : '爆款推荐',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7), fontSize: 18),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == 'step' ? '精心优选' : '最受欢迎',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7), fontSize: 14),
        ),
      ],
    );
  }

  List<Widget> _getChildrenList() {
    List<HotGoodsItem> list = _getItems();
    return List.generate(list.length, (int index) {
      return Container(
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'lib/assets/icon-test.jpeg',
                    width: 80,
                    height: 80,
                  );
                },
                list[index].picture,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '¥${list[index].price}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.type == 'step' ? Colors.blue : Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getChildrenList(),
          ),
        ],
      ),
    );
  }
}

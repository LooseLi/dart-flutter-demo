import 'package:flutter/material.dart';
import 'package:flutter_base/viewmodels/home.dart';

class TheMoreList extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  const TheMoreList({super.key, required this.recommendList});

  @override
  State<TheMoreList> createState() => _TheMoreListState();
}

class _TheMoreListState extends State<TheMoreList> {
  Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                widget.recommendList[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'lib/assets/icon-test.jpeg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: '¥${widget.recommendList[index].price}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: ''),
                      TextSpan(
                        text: '¥${widget.recommendList[index].price}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${widget.recommendList[index].payCount}人付款',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.recommendList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildren(index),
        );
      },
    );
  }
}

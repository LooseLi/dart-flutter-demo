import 'package:flutter/material.dart';

class TheMoreList extends StatefulWidget {
  const TheMoreList({super.key});

  @override
  State<TheMoreList> createState() => _TheMoreListState();
}

class _TheMoreListState extends State<TheMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            '商品',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      },
    );
  }
}

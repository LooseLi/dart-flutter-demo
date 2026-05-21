import 'package:flutter/material.dart';

class TheCategory extends StatefulWidget {
  const TheCategory({super.key});

  @override
  State<TheCategory> createState() => _TheCategoryState();
}

class _TheCategoryState extends State<TheCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 60,
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text('分类$index', style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}

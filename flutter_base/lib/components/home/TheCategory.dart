import 'package:flutter/material.dart';
import 'package:flutter_base/models/home.dart';

class TheCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  const TheCategory({super.key, required this.categoryList});

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            height: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.network(
                  widget.categoryList[index].picture,
                  width: 40,
                  height: 40,
                ),
                Text(
                  widget.categoryList[index].name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

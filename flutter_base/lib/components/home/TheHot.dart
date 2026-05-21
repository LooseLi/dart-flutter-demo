import 'package:flutter/material.dart';

class TheHot extends StatefulWidget {
  const TheHot({super.key});

  @override
  State<TheHot> createState() => _TheHotState();
}

class _TheHotState extends State<TheHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('爆款推荐', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}

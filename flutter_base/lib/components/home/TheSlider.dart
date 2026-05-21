import 'package:flutter/material.dart';

class TheSlider extends StatefulWidget {
  const TheSlider({super.key});

  @override
  State<TheSlider> createState() => _TheSliderState();
}

class _TheSliderState extends State<TheSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      alignment: Alignment.center,
      child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}

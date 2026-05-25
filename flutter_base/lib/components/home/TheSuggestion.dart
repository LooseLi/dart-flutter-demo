import 'package:flutter/material.dart';
import 'package:flutter_base/viewmodels/home.dart';

class TheSuggestion extends StatefulWidget {
  final HotRecommendResult hotRecommendResult;
  const TheSuggestion({super.key, required this.hotRecommendResult});

  @override
  State<TheSuggestion> createState() => _TheSuggestionState();
}

class _TheSuggestionState extends State<TheSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('推荐', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

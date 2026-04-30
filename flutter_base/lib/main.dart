import 'package:flutter/material.dart';

// MaterialApp组件，整个应用被MaterialApp包裹
// Scaffold，页面骨架组件
void main(List<String> args) {
  runApp(
    MaterialApp(
      title: '别学了',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('卷不动了')),
        body: Container(child: Center(child: Text('阿巴阿巴'))),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(child: Text('底底底底底底底底')),
        ),
      ),
    ),
  );
}

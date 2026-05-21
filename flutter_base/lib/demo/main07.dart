import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// 父传子（构造函数传参）
// 1.子组件定义接收属性
// 2.子组件在构造函数中接收参数
// 3.父组件传递属性给子组件
// 4.有状态组件在对外的类接收属性，对内的类通过 widget 对象获取对应属性
// 5.注意：子组件定义接收属性需要使用final关键字，因为属性由父组件决定，子组件不能随意更改

// 子传父
// 1.父组件传递一个函数给子组件
// 2.子组件调用该函数
// 3.父组件通过回调函数获取参数

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('父组件', style: TextStyle(color: Colors.blue, fontSize: 24)),
              // ChildWidget(message: '父组件传给我的'),
              Child(
                message: '父组件传给我的',
                callback: (index) {
                  print('index: $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ChildWidget extends StatelessWidget {
//   final String? message;

//   const ChildWidget({super.key, this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(
//         '子组件: $message',
//         style: TextStyle(color: Colors.black, fontSize: 20),
//       ),
//     );
//   }
// }

class Child extends StatefulWidget {
  final String? message;
  final Function(int index) callback;
  const Child({super.key, this.message, required this.callback});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          widget.callback(1);
        },
        child: Text(
          '子组件: ${widget.message}',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

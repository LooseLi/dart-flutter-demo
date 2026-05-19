import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// ListView默认构建，和SingleChildScrollView一致
// ListView.builder，按需加载；ListView.separated，和ListView.builder一致，多了构建分割线能力
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView')),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 10,
              color: Colors.yellow,
            );
          },
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
        // body: ListView.builder(
        //   itemCount: 50,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       margin: EdgeInsets.only(bottom: 20),
        //       padding: EdgeInsets.all(20),
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text(
        //         '${index + 1}',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   },
        // ),
        // body: ListView(
        //   children: List.generate(50, (index) {
        //     return Container(
        //       margin: EdgeInsets.only(bottom: 20),
        //       padding: EdgeInsets.all(20),
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text(
        //         '${index + 1}',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }
}

// SingleChildScrollView滚动组件，只能包含一个子组件
// 控制滚动，绑定ScrollController对象给controller，使用jumpTo/animateTo方法控制滚动
// 一次性构建所有子组件，会有性能问题，建议使用ListView
// class _MyAppState extends State<MyApp> {
//   final ScrollController _controller = ScrollController(); // 滚动条控制器

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('ListView')),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               controller: _controller,
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 children: List.generate(50, (index) {
//                   return Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     width: double.infinity,
//                     height: 100,
//                     alignment: Alignment.center,
//                     color: Colors.blue,
//                     child: Text(
//                       '${index + 1}',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Positioned(
//               top: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   // _controller.jumpTo(_controller.position.maxScrollExtent);
//                   _controller.animateTo(
//                     _controller.position.maxScrollExtent,
//                     duration: Duration(seconds: 1),
//                     curve: Curves.bounceIn,
//                   ); // 有动画跳转
//                 },
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Text('去底部', style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   _controller.jumpTo(0);
//                 },
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Text('去顶部', style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

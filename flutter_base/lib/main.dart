import 'package:flutter/material.dart';

// MaterialApp组件，整个应用被MaterialApp包裹
// Scaffold，页面骨架组件
// void main(List<String> args) {
//   runApp(
//     MaterialApp(
//       title: '别学了',
//       theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(title: Text('卷不动了')),
//         body: Container(child: Center(child: Text('阿巴阿巴'))),
//         bottomNavigationBar: Container(
//           height: 80,
//           child: Center(child: Text('底底底底底底底底')),
//         ),
//       ),
//     ),
//   );
// }

void main(List<String> args) {
  runApp(MyApp());
}

// 无状态组价，StatelessWidget，不能改变状态的组件
// build方法，构建UI界面，返回一个Widget组件

// 无状态组件生命周期
// build方法，每次组件需要更新时都会调用build方法，重新构建UI界面

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('build方法被调用了');
//     return MaterialApp(
//       title: '别学了',
//       theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(title: Text('卷不动了StatelessWidget')),
//         body: Container(child: Center(child: Text('阿巴阿巴'))),
//         bottomNavigationBar: Container(
//           height: 80,
//           child: Center(child: Text('底底底底底底底底')),
//         ),
//       ),
//     );
//   }
// }

// 有状态组件，StatefulWidget，可以改变状态的组件
// 需要创建两个类，一个是StatefulWidget类，一个是State类
// StatefulWidget类，主要接收和定义最终参数，核心作用是创建 State 对象
// State类，负责管理所有可变的数据和业务逻辑，并实现 build 方法来构建 UI 界面

// StatefulWidget生命周期
// 创建阶段：createState => initState => didChangeDependencies => build
// 更新阶段：didUpdateWidget => build
// 销毁阶段：dispose
// 执行一次函数：createState、initState、dispose

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    print('createState方法被调用了');
    // 返回State类的实例
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print('initState方法被调用了');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies方法被调用了');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build方法被调用了');
    return MaterialApp(
      title: '别学了',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('卷不动了StatefulWidget')),
        body: Container(child: Center(child: Text('阿巴阿巴'))),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(child: Text('底底底底底底底底')),
        ),
      ),
    );
  }
}

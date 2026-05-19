import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // Flex+Expanded
    // return MaterialApp(
    //   home: Scaffold(
    //     body: Container(
    //       width: double.infinity,
    //       color: Colors.yellow,
    //       alignment: Alignment.center,
    //       child: Flex(
    //         direction: Axis.horizontal,
    //         children: [
    //           Expanded(
    //             flex: 2,
    //             child: Container(width: 100, height: 100, color: Colors.blue),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: Container(width: 100, height: 100, color: Colors.red),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // Wrap
    // List<Widget> getList() {
    //   return List.generate(10, (index) {
    //     return Container(width: 100, height: 100, color: Colors.blue);
    //   });
    // }

    // return MaterialApp(
    //   home: Scaffold(
    //     body: Container(
    //       width: double.infinity,
    //       color: Colors.yellow,
    //       alignment: Alignment.center,
    //       child: Wrap(
    //         spacing: 10,
    //         runSpacing: 10,
    //         direction: Axis.horizontal,
    //         children: getList(),
    //       ),
    //     ),
    //   ),
    // );

    // Stack+Positioned
    // Stack中子组件的层叠顺序由其在 children 列表中的顺序决定
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.yellow,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.blue),
              Container(width: 150, height: 150, color: Colors.red),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(width: 100, height: 100, color: Colors.green),
              ),
              Image.asset(
                'lib/images/Message_Dots.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

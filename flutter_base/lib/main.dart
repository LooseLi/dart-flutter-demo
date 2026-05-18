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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            // color: Colors.blue,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.yellow, width: 2),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            transform: Matrix4.rotationZ(0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      count -= 1;
                    });
                  },
                  child: Text('减', style: TextStyle(color: Colors.white)),
                ),
                Text(count.toString(), style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      count += 1;
                    });
                  },
                  child: Text('加', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

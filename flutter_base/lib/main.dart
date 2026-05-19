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
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField')),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: _userController,
                onChanged: (value) {
                  print('onChanged: $value'); // 监听数据变化
                },
                onSubmitted: (value) {
                  print('onSubmitted: $value'); // 提交时触发
                },
                decoration: InputDecoration(
                  // 定制样式
                  contentPadding: EdgeInsets.only(left: 10),
                  fillColor: Colors.amber,
                  filled: true,
                  hintText: '请输入账号',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true, // 隐藏输入内容
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  fillColor: Colors.amber,
                  filled: true,
                  hintText: '请输入密码',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    print(
                      '账号：${_userController.text}，密码：${_passwordController.text}',
                    );
                  },
                  child: Text('提交', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

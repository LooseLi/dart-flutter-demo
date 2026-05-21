import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/list',
      routes: {
        '/list': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
      home: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('列表页')),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // print('$index');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailPage(),
              //   ),
              // );
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: {'id': index + 1},
              );
            },
            child: Container(
              height: 60,
              margin: EdgeInsets.all(10),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _id = 0;

  @override
  void initState() {
    super.initState();
    // 异步微任务中获取路由参数
    Future.microtask(() {
      if (ModalRoute.of(context) != null) {
        Map<String, dynamic> params =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        _id = params['id'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页')),
      body: Center(
        child: Column(
          children: [
            Text('这是详情页面$_id'),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    _getChannels();
  }

  List _list = [];

  void _getChannels() async {
    DioUtils util = DioUtils(); // 创建实例化对象
    Response<dynamic> result = await util.get('/channels');
    Map<String, dynamic> res = result.data as Map<String, dynamic>;
    List data = res['data']['channels'] as List;
    _list = data;
    if (mounted) {
      setState(() {});
    }
    // print(_list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dio')),
        body: GridView.extent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
          children: List.generate(_list.length, (index) {
            return ChannelItem(item: _list[index]);
          }),
        ),
      ),
    );
  }
}

class ChannelItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const ChannelItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        '${item['name'] ?? '未知'}',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

// 封装 dio 工具类
class DioUtils {
  final Dio _dio = Dio();
  DioUtils() {
    // _dio.options.connectTimeout = Duration(seconds: 10); // 连接超时
    // _dio.options.sendTimeout = Duration(seconds: 10); // 发送超时
    // _dio.options.receiveTimeout = Duration(seconds: 10); // 接收超时
    _dio.options
      ..baseUrl = 'https://geek.itheima.net/v1_0'
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);

    _addInterceptor(); // 拦截器
  }
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (context, handler) {
          handler.next(context); // 放行
          // handler.reject(error) // 拦截
        },
        // 响应拦截器
        onResponse: (context, handler) {
          if (context.statusCode! >= 200 && context.statusCode! < 300) {
            handler.next(context);
            return;
          }
          handler.reject(DioException(requestOptions: context.requestOptions));
        },
        // 错误拦截器
        onError: (context, handler) {
          handler.reject(context);
        },
      ),
    );
  }

  // get
  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}

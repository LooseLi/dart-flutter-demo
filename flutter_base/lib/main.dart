import 'package:dio/dio.dart';

void main(List<String> args) {
  Dio()
      .get("/channels")
      .then((res) {
        print(res);
      })
      .catchError((error) {
        print(error);
      });
}

// 封装 dio 工具类
class DioUtils {
  final Dio _dio = Dio();
  DioUtils() {
    // _dio.options.baseUrl = 'https://xxx'; // 基础地址
    // _dio.options.connectTimeout = Duration(seconds: 10); // 连接超时
    // _dio.options.sendTimeout = Duration(seconds: 10); // 发送超时
    // _dio.options.receiveTimeout = Duration(seconds: 10); // 接收超时
    _dio.options
      ..baseUrl = 'https://xxx'
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
  get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_base/routes/index.dart';

void main(List<String> args) {
  runApp(getRootWidget());
}

/**
 * 生成调试版，未签名，用于测试
 * flutter build apk --debug
 * 
 * 发布版 apk，需要签名配置
 * flutter build apk --release
 * 
 */

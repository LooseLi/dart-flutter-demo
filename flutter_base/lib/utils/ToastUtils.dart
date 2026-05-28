import 'package:flutter/material.dart';

class ToastUtils {
  static bool isLoading = false;
  static final _time = 1;
  static void showToast(BuildContext context, String? msg) {
    if (ToastUtils.isLoading) {
      return;
    }
    ToastUtils.isLoading = true;
    Future.delayed(Duration(seconds: _time), () {
      ToastUtils.isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        duration: Duration(seconds: _time),
        behavior: SnackBarBehavior.floating,
        content: Text(msg ?? '加载中', textAlign: TextAlign.center),
      ),
    );
  }
}

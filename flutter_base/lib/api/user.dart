import 'package:flutter_base/constants/index.dart';
import 'package:flutter_base/models/user.dart';
import 'package:flutter_base/utils/DioRequest.dart';

Future<UserInfo> loginAPI(Map<String, dynamic> data) async {
  return UserInfo.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}

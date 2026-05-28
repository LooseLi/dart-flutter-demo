import 'package:flutter_base/models/user.dart';
import 'package:get/get.dart';

class User extends GetxController {
  var user = UserInfo.fromJSON({}).obs; // obs user对象被监听了
  updateUserInfo(UserInfo newUser) {
    user.value = newUser;
  }
}

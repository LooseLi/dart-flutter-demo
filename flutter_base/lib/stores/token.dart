import 'package:flutter_base/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Token {
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = '';
  Future<void> init() async {
    final pref = await _getInstance();
    _token = pref.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }

  Future<void> setToken(String value) async {
    final pref = await _getInstance();
    pref.setString(GlobalConstants.TOKEN_KEY, value);
    _token = value;
  }

  String getToken() {
    return _token;
  }

  Future<void> removeToken() async {
    final pref = await _getInstance();
    pref.remove(GlobalConstants.TOKEN_KEY);
    _token = '';
  }
}

final token = Token();

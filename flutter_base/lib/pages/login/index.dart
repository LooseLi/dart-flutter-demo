import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/api/user.dart';
import 'package:flutter_base/stores/user.dart';
import 'package:flutter_base/utils/ToastUtils.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final User _userController = Get.find();

  Widget _buildHeader() {
    return Container(
      child: Text(
        '账号密码登录',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPhoneTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '手机号不能为空';
        }
        if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value)) {
          return '请输入正确的手机号';
        }
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: '请输入账号',
        fillColor: Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Widget _buildCodeTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '密码不能为空';
        }
        return null;
      },
      controller: _codeController,
      obscureText: true, // 密文
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: '请输入密码',
        fillColor: Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  bool _isChecked = false;
  Widget _buildCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: Colors.black,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          side: BorderSide(color: Colors.grey, width: 2),
          onChanged: (bool? value) {
            _isChecked = value ?? false;
            setState(() {});
          },
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '查看并同意'),
              TextSpan(
                text: '《隐私条款》',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: '和'),
              TextSpan(
                text: '《用户协议》',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: Colors.black),
      onPressed: () {
        if (_key.currentState!.validate()) {
          if (_isChecked) {
            _login();
          } else {
            ToastUtils.showToast(context, '请勾选用户协议');
          }
        }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text('登录', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  _login() async {
    try {
      final res = await loginAPI({
        'account': _phoneController.text,
        'password': _codeController.text,
      });
      _userController.updateUserInfo(res);
      ToastUtils.showToast(context, '登录成功');
      Navigator.pop(context);
    } catch (e) {
      ToastUtils.showToast(context, (e as DioException).message);
    }
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('登录', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Form(
        key: _key,
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildHeader(),
              SizedBox(height: 20),
              _buildPhoneTextField(),
              SizedBox(height: 20),
              _buildCodeTextField(),
              SizedBox(height: 20),
              _buildCheckbox(),
              SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

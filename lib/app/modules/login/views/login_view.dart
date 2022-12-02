// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              appbg(),
              Column(
                children: [
                  logo(),
                  SizedBox(height: ScreenUtil().setWidth(30)),
                  input(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget appbg({Widget? child}) {
  return Container(
    width: ScreenUtil().screenWidth,
    height: ScreenUtil().screenHeight,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff47454f), Color(0xff161618), Color(0xff151516)],
        stops: [0, .47, .98],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(75)),
          child: Image.asset(
            'assets/images/login/logo-bg.png',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(120)),
          child: Opacity(
            opacity: .8,
            child: Image.asset(
              'assets/images/login/tuoyuan.png',
            ),
          ),
        ),
      ],
    ),
  );
}

Widget logo() {
  return Padding(
    padding: EdgeInsets.only(top: ScreenUtil().setWidth(160)),
    child: Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/login/logo-text.png',
          ),
          SizedBox(height: ScreenUtil().setWidth(40)),
          Image.asset(
            'assets/images/login/logo.png',
          ),
        ],
      ),
    ),
  );
}

Widget input() {
  final eyeIcon1 = Image.asset('assets/images/login/eye.png');
  final eyeIcon2 = Image.asset('assets/images/login/eye2.png');
  final eyeShow = true.obs;

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: ScreenUtil().setWidth(24),
    ),
    child: Column(
      children: [
        __inputItem(
          hintText: '账号',
          prefixIcon: Image.asset('assets/images/login/user.png'),
        ),
        SizedBox(height: ScreenUtil().setWidth(18)),
        __inputItem(
          hintText: '密码',
          prefixIcon: Image.asset('assets/images/login/pwd.png'),
          suffixIcon: Obx(
            () => IconButton(
              onPressed: () => eyeShow.value = !eyeShow.value,
              icon: eyeShow.value ? eyeIcon1 : eyeIcon2,
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setWidth(18)),
        __inputItem(
          hintText: '验证码',
          prefixIcon: Image.asset('assets/images/login/code.png'),
          suffixIcon: TextButton(
            onPressed: () {},
            child: const Text(
              '获取验证码',
              style: TextStyle(color: Color(0xffdec193)),
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setWidth(18)),
        Container(
          width: double.infinity,
          height: ScreenUtil().setWidth(44),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffDEC094), Color(0xff3C3B44)],
              stops: [0.0, 2.50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // child: ElevatedButton(
          //   onPressed: () {},
          //   style: ButtonStyle(
          //     elevation: MaterialStateProperty.all(0),
          //     backgroundColor: MaterialStateProperty.all(Color(0xffdec193)),
          //     shape: MaterialStateProperty.all(
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //     ),
          //   ),
          //   child: const Text(
          //     '登录',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
        ),
      ],
    ),
  );
}

Widget __inputItem({
  required String hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return TextField(
    style: const TextStyle(color: Color(0xffdec193), fontSize: 14),
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(24, 28, 39, 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromRGBO(203, 206, 216, 0.5)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10), //边角为30
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffdec193), //边框颜色为白色
          width: .5, //宽度为5
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10), //边角为30
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController(text: 'a@b.c');
  TextEditingController passwordController = TextEditingController(text: '123');

  RxBool showPassword = false.obs;

  login() {
    globalContext?.go(PagePath.dashboard);
  }
}

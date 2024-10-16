import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPassController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;
}

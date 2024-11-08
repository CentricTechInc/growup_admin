import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/data/repositories/auth_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repositories/auth_repo.dart';

class ForgetPassController extends GetxController {
  TextEditingController emailController = TextEditingController();
  AuthRepo authRepo = AuthRepoImpl();
  forgotPassword() async {
    try {
      String response = await authRepo.forgotPassword(emailController.text);
      CommonSnackBar.message(message: response, type: SnackBarType.success);
      globalContext?.push(
          "${PagePath.login}${PagePath.otp.toRoute}/${emailController.text}");
      print(response);
    } catch (e) {
      CommonSnackBar.message(message: e.toString());
    }
    // emailController.clear();
  }
}

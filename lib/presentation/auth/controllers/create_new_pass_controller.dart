import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/data/repositories/auth_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repositories/auth_repo.dart';

class CreateNewPassController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthRepo authRepo = AuthRepoImpl();
  bool showPassword = false;
  bool showConfirmPassword = false;

  createNewPassword(String email) async {
    try {
      String response =
          await authRepo.changePassword(email, passwordController.text);
      CommonSnackBar.message(message: response, type: SnackBarType.success);
      globalContext?.go(PagePath.login);
    } catch (e) {
      CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
    }
  }
}

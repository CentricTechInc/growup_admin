import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/data/dto/user_dto.dart';
import 'package:grow_up_admin_panel/data/repositories/auth_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repository/auth_repo.dart';

class LoginController extends GetxController {
  TextEditingController emailController =
      TextEditingController(text: 'deepak.kumar@centrictech.co');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  RxBool showPassword = false.obs;
  AuthRepo authRepo = AuthRepoImpl();
  bool isLoading = false;

  login() async {
    try {
      isLoading = true;
      update();
      UserModelDto? user =
          await authRepo.login(emailController.text, passwordController.text);
      if (user.token != null) {
        LocalStorageService.instance.user = user;
        globalContext?.go(PagePath.dashboard);
      }
      isLoading = false;
      update();
      print(user.toJson());
    } catch (e) {
      isLoading = false;
      update();
      CommonSnackBar.message(message: e.toString());
    }
  }
}

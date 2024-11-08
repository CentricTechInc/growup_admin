import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/data/repositories/auth_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repositories/auth_repo.dart';

class OtpController extends GetxController {
  final AuthRepo _repo = AuthRepoImpl();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  String otpEmail = '';
  int secondsRemaining = 1;
  Timer? timer;
  bool enableResend = false;
  void resendCode(String email) {
    secondsRemaining = 60;
    enableResend = false;
    generateOtp(email);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    initializeTimer();
  }

  void initializeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        update();
      } else {
        enableResend = true;
        update();
      }
    });
  }

  forgotEmailOtpVerification(String email, String otp) async {
    try {
      String result = await _repo.verifyOtp(email, otp);
      CommonSnackBar.message(
        message: result,
        type: SnackBarType.success,
      );
      globalContext?.push(
          "${PagePath.login}${PagePath.createNewPassword.toRoute}/$email");
      print(result);
    } catch (e) {
      CommonSnackBar.message(message: e.toString());
    }
  }

  generateOtp(String email) async {
    try {
      {
        String result = await _repo.generateOtp(email);
        CommonSnackBar.message(
          message: result,
          type: SnackBarType.success,
        );

        print(result);
      }
    } catch (e) {
      CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
    }
  }

  // Future forgotPassword() async {
  //   try {
  //     {
  //       ShowLoader.showLoading(false);
  //       final String result =
  //           await _repo.forgotPassword(emailController.text.trim());
  //       otpEmail = emailController.text;
  //       ShowLoader.hideLoading();
  //       CommonSnackBar.message(message: result, type: SnackBarType.info);
  //       if (globalContext!.mounted) {
  //         globalContext?.go(PagePath.otpscreeen);
  //       }
  //     }
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // TextEditingController newPassController = TextEditingController();
  // TextEditingController confirmPassController = TextEditingController();
  // clearFields() {
  //   newPassController.clear();
  //   confirmPassController.clear();
  // }

  // bool showPassword = true;
  // bool showConfirmPassword = true;
  // Future<void> createNewPassword() async {
  //   try {
  //     ShowLoader.showLoading(false);
  //     final String result =
  //         await _repo.createNewPassword(otpEmail, newPassController.text);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //       message: result,
  //       type: SnackBarType.success,
  //     );
  //     clearFields();
  //     if (globalContext!.mounted) {
  //       globalContext?.go(PagePath.login);
  //     }
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //       message: e.toString(),
  //     );
  //   }
  // }
}

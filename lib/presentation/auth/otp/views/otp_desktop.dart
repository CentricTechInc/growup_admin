import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/mixins/validations.dart';
import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_auth_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPDesktop extends StatefulWidget with FieldsValidation {
  OTPDesktop({super.key});

  // final String email;

  @override
  State<OTPDesktop> createState() => _OTPDesktopState();
}

class _OTPDesktopState extends State<OTPDesktop> {
  // late TextEditingController pinController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   pinController = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   pinController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (controller) {
      return CommonAuthWidget(
          showBackButton: true,
          showLogo: false,
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.3),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: 'OTP Verification'.toUpperCase(),
                  fontSize: 30,
                  weight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 50,
                ),
                const CommonText(
                  text: 'Please enter OTP code send to your email',
                  fontSize: 12,
                  color: AppColors.grey,
                  weight: FontWeight.w300,
                  // color: AppColors.secondaryText,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: SizedBox(
                    width: 300,
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      textStyle: const TextStyle(
                          fontSize: 24,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold),
                      obscureText: false,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 4) {
                          return "Invalid OTP";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                          return "OTP must be numeric";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: AppColors.primary,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 70,
                        fieldWidth: 70,
                        selectedFillColor: AppColors.white,
                        errorBorderColor: AppColors.red,
                        selectedColor: AppColors.primary,
                        inactiveColor: AppColors.white,
                        activeFillColor: AppColors.white,
                        inactiveFillColor: AppColors.greyish,
                      ),
                      cursorColor: AppColors.primary,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      enablePinAutofill: true,
                      controller: controller.pinController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                      onChanged: (String value) {},
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Didn\'t recieve any code? ',
                      style: const TextStyle(color: AppColors.grey),
                      children: [
                        TextSpan(
                          text: controller.enableResend
                              ? 'Resend'
                              : '(${controller.secondsRemaining})',
                          style: const TextStyle(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              controller.enableResend
                                  ? controller.resendCode(controller.otpEmail)
                                  : null;
                            },
                        )
                      ]),
                ),
                const SizedBox(
                  height: 80,
                ),
                CommonTextButton(
                    width: context.width * .2,
                    height: 55,
                    fontSize: 16,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // controller.forgotEmailOtpVerification(
                        //     controller.otpEmail, pinController.text);
                        context.push(PagePath.login +
                            PagePath.createNewPassword.toRoute);
                        controller.pinController.clear();
                      }
                    },
                    text: 'Verify')
              ],
            ),
          ));
    });
  }
}

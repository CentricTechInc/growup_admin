import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/mixins/validations.dart';
import 'package:grow_up_admin_panel/app/util/common_auth_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/forget_pass_controller.dart';

class ForgotPassDesktop extends StatelessWidget with FieldsValidation {
  ForgotPassDesktop({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CommonAuthWidget(
        showBackButton: true,
        showLogo: false,
        padding: Responsive.isDesktop(context)
            ? EdgeInsets.symmetric(horizontal: context.width * 0.3)
            : null,
        child: GetBuilder<ForgetPassController>(builder: (controller) {
          return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: 'forgot password'.toUpperCase(),
                    fontSize: 30,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const CommonText(
                    text:
                        'Please enter your email below and we will send you the OTP code',
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CommonTextField(
                    controller: controller.emailController,
                    hintText: 'Email',
                    suffixIcon: Icons.alternate_email_outlined,
                    validator: validateEmail,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CommonTextButton(
                      width: double.maxFinite,
                      height: 50,
                      fontSize: 16,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // await controller.forgotPassword();
                          context.push(PagePath.login + PagePath.otp.toRoute);
                          controller.emailController.clear();
                        }
                      },
                      text: 'Send'),
                ],
              ));
        }));
  }
}

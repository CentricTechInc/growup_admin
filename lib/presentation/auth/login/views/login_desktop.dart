import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/mixins/validations.dart';
import 'package:grow_up_admin_panel/app/util/common_auth_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/login_controller.dart';

class LoginDesktop extends StatelessWidget with FieldsValidation {
  LoginDesktop({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CommonAuthWidget(
      child: Form(
        key: formKey,
        child: GetBuilder<LoginController>(builder: (controller) {
          return SizedBox(
            height: context.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    Assets.logo,
                    height: 180,
                    width: 180,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CommonTextField(
                  isBorderEnabled: false,
                  controller: controller.emailController,
                  hintText: 'Email',
                  suffixIcon: Icons.alternate_email_outlined,
                  validator: validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(() {
                  return CommonTextField(
                    isBorderEnabled: false,
                    controller: controller.passwordController,
                    hintText: 'Password',
                    validator: emptyFieldValidation,
                    pass: !controller.showPassword.value,
                    suffixIcon: !controller.showPassword.value
                        ? Icons.lock_outline
                        : Icons.lock_open_outlined,
                    suffixIconOnTap: () {
                      controller.showPassword.toggle();
                    },
                    onFieldSubmitted: (_) async {
                      if (formKey.currentState!.validate()) {
                        await controller.login();
                      }
                    },
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    context
                        .push(PagePath.login + PagePath.forgotPassword.toRoute);
                  },
                  child: const CommonText(
                    text: 'Forgot Password?',
                    fontSize: 16,
                    weight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
                const VerticalSpacing(70),
                controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CommonTextButton(
                        width: double.maxFinite,
                        height: 50,
                        fontSize: 16,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await controller.login();
                          }
                        },
                        text: 'Login'),
              ],
            ),
          );
        }),
      ),
    );
  }
}

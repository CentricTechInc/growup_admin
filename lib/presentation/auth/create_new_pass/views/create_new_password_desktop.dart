import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/mixins/validations.dart';
import 'package:grow_up_admin_panel/app/util/common_auth_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/create_new_pass_controller.dart';

class CreateNewPassDesktop extends StatelessWidget with FieldsValidation {
  CreateNewPassDesktop({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewPassController>(builder: (controller) {
      return CommonAuthWidget(
        showBackButton: true,
        showLogo: false,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.3),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: 'Create New Password'.toUpperCase(),
                fontSize: 30,
                weight: FontWeight.w600,
              ),
              const SizedBox(
                height: 50,
              ),
              CommonTextField(
                  controller: controller.passwordController,
                  hintText: 'New Password',
                  validator: emptyFieldValidation,
                  pass: !controller.showPassword,
                  suffixIcon: !controller.showPassword
                      ? Icons.lock_outline
                      : Icons.lock_open_outlined,
                  suffixIconOnTap: () {
                    controller.showPassword = !controller.showPassword;
                    controller.update();
                  }),
              const SizedBox(
                height: 25,
              ),
              CommonTextField(
                controller: controller.confirmPasswordController,
                hintText: 'Confrim Password',
                validator: (p0) =>
                    matchPass(p0, controller.passwordController.text),
                pass: !controller.showConfirmPassword,
                suffixIcon: !controller.showConfirmPassword
                    ? Icons.lock_outline
                    : Icons.lock_open_outlined,
                suffixIconOnTap: () {
                  controller.showConfirmPassword =
                      !controller.showConfirmPassword;
                  controller.update();
                },
              ),
              const SizedBox(
                height: 80,
              ),
              CommonTextButton(
                  width: double.maxFinite,
                  height: 50,
                  fontSize: 16,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // controller.createNewPassword();
                    }
                  },
                  text: 'Save'),
            ],
          ),
        ),
      );
    });
  }
}

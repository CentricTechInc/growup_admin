import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/login_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/login/views/login_desktop.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (context) {
        return Responsive(
            mobile: LoginDesktop(),
            tablet: LoginDesktop(),
            desktop: LoginDesktop());
      }),
    );
  }
}

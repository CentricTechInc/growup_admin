import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/presentation/auth/login/views/login_desktop.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
          mobile: LoginDesktop(),
          tablet: LoginDesktop(),
          desktop: LoginDesktop()),
    );
  }
}

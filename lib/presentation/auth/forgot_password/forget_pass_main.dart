import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/presentation/auth/forgot_password/views/forget_pass_desktop.dart';

class ForgetPassMain extends StatelessWidget {
  const ForgetPassMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: ForgotPassDesktop(),
        tablet: ForgotPassDesktop(),
        desktop: ForgotPassDesktop(),
      ),
    );
  }
}

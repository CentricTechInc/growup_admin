import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/presentation/auth/create_new_pass/views/create_new_password_desktop.dart';

class CreateNewPassMain extends StatelessWidget {
  const CreateNewPassMain({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: CreateNewPassDesktop(email: email),
        tablet: CreateNewPassDesktop(
          email: email,
        ),
        desktop: CreateNewPassDesktop(
          email: email,
        ),
      ),
    );
  }
}

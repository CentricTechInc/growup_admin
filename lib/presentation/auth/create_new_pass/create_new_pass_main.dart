import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/presentation/auth/create_new_pass/views/create_new_password_desktop.dart';

class CreateNewPassMain extends StatelessWidget {
  const CreateNewPassMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: CreateNewPassDesktop(),
        tablet: CreateNewPassDesktop(),
        desktop: CreateNewPassDesktop(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/presentation/auth/otp/views/otp_desktop.dart';

class OTPMain extends StatelessWidget {
  const OTPMain({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: OTPDesktop(
          email: email,
        ),
        tablet: OTPDesktop(
          email: email,
        ),
        desktop: OTPDesktop(
          email: email,
        ),
      ),
    );
  }
}

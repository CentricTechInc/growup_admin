import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/extensions/build_context_ext.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;

  final Widget? tablet;

  final Widget? desktop;

  const Responsive(
      {super.key, required this.mobile, this.tablet, this.desktop});

  static isMobile(BuildContext context) => context.width < 599;

  static isTablet(BuildContext context) =>
      context.width < 1024 && context.width > 600;

  static isDesktop(BuildContext context) => context.width >= 1280;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1400) {
        print('desktop ${constraints.maxWidth}');
        return desktop ?? mobile;
      } else if (constraints.maxWidth >= 800) {
        print('tablet ${constraints.maxWidth}');
        return tablet ?? mobile;
      } else {
        print('mobile ${constraints.maxWidth}');
        return mobile;
      }
    });
  }
}

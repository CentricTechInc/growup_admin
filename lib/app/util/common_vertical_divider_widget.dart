import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonVerticalDivider extends StatelessWidget {
  const CommonVerticalDivider(
      {super.key, this.color, this.width, this.padding});

  final Color? color;
  final double? width;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: VerticalDivider(
        width: width ?? 3,
        color: color ?? AppColors.grey,
      ),
    );
  }
}

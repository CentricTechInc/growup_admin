import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:sizer/sizer.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.primary,
    this.animationDuration,
    this.alignment,
    this.width = 150,
    this.height = 55,
    this.elevation = 2,
    this.color = AppColors.white,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
  });
  final VoidCallback onPressed;
  final Duration? animationDuration;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final double width;
  final double height;
  final String text;
  final Color color;
  final double elevation;
  final double? fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          shadowColor:
              MaterialStateProperty.all(AppColors.primary.withOpacity(.8)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 6)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          animationDuration: animationDuration,
        ),
        child: CommonText(
          text: text,
          fontSize: fontSize ?? 8.sp,
          weight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}

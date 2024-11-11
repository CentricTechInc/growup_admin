import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color? color;
  final TextOverflow textOverflow;
  final FontWeight weight;
  final double? fontSize;
  final TextAlign textAlign;
  final double lineHeight;
  final double letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;

  const CommonText({
    super.key,
    required this.text,
    this.maxLines,
    this.color,
    this.textOverflow = TextOverflow.visible,
    this.fontFamily = 'Cabin',
    this.weight = FontWeight.w400,
    this.fontSize,
    this.textAlign = TextAlign.left,
    this.letterSpacing = 0,
    this.lineHeight = 1.2,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: true,
      style: TextStyle(
        color: color ?? AppColors.primaryText,
        fontFamily: fontFamily,
        fontWeight: weight,
        // fontSize: fontSize ?? 20,
        fontSize: fontSize
        // Responsive.isDesktop(context)
        //     ? (fontSize! * context.width) / 1400
        //     : Responsive.isTablet(context)
        //         ? (fontSize! * context.width) / 1500
        //         : (fontSize! * context.width) / 1600

        // ?fontSize
        //   : Responsive.isTablet(context)
        //       ? fontSize! - 3
        //       : fontSize! - 5,
        ,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.primaryText,
        height: lineHeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

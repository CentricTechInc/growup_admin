import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class TitleWithValueWidget extends StatelessWidget {
  const TitleWithValueWidget(
      {super.key, required this.title, required this.value, this.txtColor});

  final String title, value;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontSize: 16,
          weight: FontWeight.w700,
        ),
        const VerticalSpacing(10),
        CommonText(
          text: value,
          fontSize: 16,
          weight: FontWeight.w600,
          color: txtColor ?? AppColors.secondaryText,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.noGiftIconIcon,
          scale: 2,
        ),
        const VerticalSpacing(10),
        CommonText(
          text: title,
          fontSize: 16,
          weight: FontWeight.w600,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}

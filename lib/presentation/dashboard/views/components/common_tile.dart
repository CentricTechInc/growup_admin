import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonTile extends StatelessWidget {
  const CommonTile({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

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
        const VerticalSpacing(5),
        CommonText(
          text: subTitle,
          fontSize: 16,
          weight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}

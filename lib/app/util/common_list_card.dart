import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:sizer/sizer.dart';

class CommonListCards extends StatelessWidget {
  const CommonListCards({
    this.onTap,
    this.text = '',
    super.key,
    this.icon = Assets.forwardButton,
  });

  final VoidCallback? onTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 7.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.transparent,
            border: Border.all(color: AppColors.grey, width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: text,
                fontSize: 12.sp,
                weight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
              ImageIcon(
                AssetImage(
                  icon,
                ),
                color: AppColors.secondaryText,
                size: 2.2.h,
              ),
            ],
          )),
    );
  }
}

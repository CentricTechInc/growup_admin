import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.name, required this.relation});
  final String name, relation;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            Assets.schoolImg,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const HorizontalSpacing(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: name,
              fontSize: 20,
              weight: FontWeight.w600,
              color: AppColors.primary,
            ),
            Row(
              children: [
                Image.asset(
                  Assets.relationIcon,
                  scale: 2,
                ),
                const HorizontalSpacing(5),
                CommonText(
                  text: relation,
                  fontSize: 16,
                  weight: FontWeight.w500,
                  color: AppColors.secondaryText,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        CommonIconButton(
          icon: Assets.deleteIcon,
          onTap: () {},
          color: AppColors.red,
        ),
        // const HorizontalSpacing(20),
        // CommonIconButton(
        //   icon: Assets.upChevronIcon,
        //   onTap: () {},
        //   color: AppColors.darkGrey,
        // ),
      ],
    );
  }
}

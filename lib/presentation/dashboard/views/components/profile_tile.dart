import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {super.key,
      required this.name,
      required this.relation,
      required this.deleteOnTap,
      required this.profileImg});

  final String name, relation, profileImg;
  final VoidCallback deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            profileImg,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, widget, _) {
              return const SizedBox(
                height: 60,
                width: 60,
                child: Icon(
                  Icons.error_outline,
                  color: AppColors.red,
                ),
              );
            },
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
          onTap: deleteOnTap,
          color: AppColors.red,
        ),
      ],
    );
  }
}

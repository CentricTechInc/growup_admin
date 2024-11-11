import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

class GiftingDeatilsExpansionCollapsed extends StatelessWidget {
  const GiftingDeatilsExpansionCollapsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CommonText(
          text: 'Dream Weavers',
          fontSize: 16,
          weight: FontWeight.w600,
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5.5,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.calendarIcon,
                scale: 1.7,
                color: AppColors.secondary,
              ),
              const HorizontalSpacing(10),
              const CommonText(
                text: 'Every Month',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ],
          ),
        ),
        const HorizontalSpacing(30),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5.5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.dollorIcon,
                scale: 2,
                color: AppColors.primary,
              ),
              const HorizontalSpacing(10),
              const CommonText(
                text: '\$ 15000.00',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
              const HorizontalSpacing(5),
              const CommonText(
                text: 'Giftings Total',
                fontSize: 12,
                weight: FontWeight.w700,
                color: AppColors.secondaryText,
              ),
            ],
          ),
        ),
        const HorizontalSpacing(30),
        SizedBox(
          width: 131,
          child: CommonDropDownWidget(
            onChanged: (p0) {},
            arryList: ['Paid', 'Un-Paid'],
            selectedItem: 'Paid',
          ),
        ),
        const HorizontalSpacing(40),
        CommonIconButton(
          icon: Assets.deleteIcon,
          onTap: () {},
          color: AppColors.red,
        ),
      ],
    );
  }
}

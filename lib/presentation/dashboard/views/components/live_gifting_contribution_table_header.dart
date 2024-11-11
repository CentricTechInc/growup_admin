import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class LiveGiftingContributionTableHeader extends StatelessWidget {
  const LiveGiftingContributionTableHeader(
      {super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[4],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

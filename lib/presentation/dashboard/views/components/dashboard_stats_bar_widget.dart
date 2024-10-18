import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class DashboardStatsBarWidget extends StatelessWidget {
  const DashboardStatsBarWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final List<String> title;
  final List<String> subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: List.generate(
          3,
              (index) => Expanded(
            child: Visibility(
              visible: index != 0,
              replacement: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalSpacing(30),
                  CommonText(
                    text: 'Total Active Users',
                    fontSize: 16,
                    weight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                  VerticalSpacing(10),
                  CommonText(
                    text: '1200',
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: context.height * 0.08,
                    child: const CommonVerticalDivider(),
                  ),
                  const HorizontalSpacing(30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HorizontalSpacing(30),
                      CommonText(
                        text: 'Total Active Users',
                        fontSize: 16,
                        weight: FontWeight.w500,
                        color: AppColors.secondaryText,
                      ),
                      VerticalSpacing(10),
                      CommonText(
                        text: '1200',
                        fontSize: 16,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
              child: const Row(
                children: [
                  SizedBox(
                    height: 60,
                    child: CommonVerticalDivider(),
                  ),
                  HorizontalSpacing(30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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

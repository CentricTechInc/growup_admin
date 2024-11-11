import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';

class DashboardStatsBarWidget extends StatelessWidget {
  const DashboardStatsBarWidget({
    super.key,
    // required this.title,
    // required this.subTitle,
  });

  // final List<String> title;
  // final List<String> subTitle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Expanded(
                child: CountWidget(
                    title: 'Total Active Users',
                    count: '${controller.countObjects?.usersCount ?? 0}')),
            const SizedBox(
              height: 60,
              width: 50,
              child: CommonVerticalDivider(),
            ),
            Expanded(
                child: CountWidget(
                    title: 'Active Giftings',
                    count: '${controller.countObjects?.giftCount ?? 0}')),
            const SizedBox(
              height: 60,
              width: 50,
              child: CommonVerticalDivider(),
            ),
            Expanded(
                child: CountWidget(
                    title: 'Total Contributions',
                    count:
                        '${controller.countObjects?.totalgiftContributors ?? 0}')),
          ]));
    });
  }
}

class CountWidget extends StatelessWidget {
  const CountWidget({
    super.key,
    this.count,
    this.title,
  });
  final String? title;
  final String? count;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HorizontalSpacing(30),
        CommonText(
          text: title ?? '',
          fontSize: 16,
          weight: FontWeight.w500,
          color: AppColors.secondaryText,
        ),
        const VerticalSpacing(10),
        CommonText(
          text: count ?? '',
          fontSize: 16,
          weight: FontWeight.w600,
        ),
      ],
    );
  }
}

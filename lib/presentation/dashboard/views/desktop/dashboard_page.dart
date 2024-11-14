import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/active_user__chart_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_list_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/contribution_and_payout_ratio_chart_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/contributions_chart_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/dashboard_stats_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payout_body_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payout_header_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/recent_contribution_body_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/recent_contribution_header_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/recent_user_body_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/recent_user_header_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/top_gifting_chart_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: 'Hi ${LocalStorageService.instance.user!.name}',
              fontSize: 24,
              weight: FontWeight.w700,
            ),
            const VerticalSpacing(20),
            const DashboardStatsBarWidget(),
            const VerticalSpacing(20),
            Wrap(spacing: 20, runSpacing: 10, children: [
              const SizedBox(
                  width: 600, height: 350, child: ActiveUserChartWidget()),
              const SizedBox(
                  width: 450, height: 350, child: TopGiftingChartWidget()),
              const SizedBox(
                  width: 450, height: 350, child: ContributionsChartWidget()),
              const SizedBox(
                  width: 650,
                  height: 350,
                  child: ContributionAndPayoutRatioChartWidget()),
              SizedBox(
                  width: 850,
                  height: 350,
                  child: CommonListWidget(
                    title: "Payout",
                    header: const PayoutHeaderWidget(),
                    body: PayoutBodyWidget(
                      payoutList: controller.payoutObject,
                    ),
                  )),
              SizedBox(
                  width: 750,
                  height: 350,
                  child: CommonListWidget(
                    title: "Recent Users",
                    header: const RecentUsersHeaderWidget(),
                    body: RecentUsersBodyWidget(
                      recentUsersObject: controller.recentUsersObject,
                    ),
                  )),
              SizedBox(
                  width: 750,
                  height: 350,
                  child: CommonListWidget(
                    title: "Recent Contributions",
                    header: const RecentContributionHeaderWidget(),
                    body: RecentContributionBodyWidget(
                      recentContributions: controller.recentContributions,
                    ),
                  ))
            ])
          ],
        ),
      );
    });
  }
}

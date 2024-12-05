import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/active_user__chart_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_list_widget.dart';
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
  DashboardPage({super.key});

  final sidebarcontroller = Get.find<SideBarController>();

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
                  width: 580, height: 350, child: ActiveUserChartWidget()),
              SizedBox(
                  width: 470, height: 350, child: TopGiftingChartWidget()),
              const SizedBox(
                  width: 450, height: 350, child: ContributionsChartWidget()),
              // const SizedBox(
              //     width: 650,
              //     height: 350,
              //     child: ContributionAndPayoutRatioChartWidget()),
              SizedBox(
                  width: 750,
                  height: 350,
                  child: CommonListWidget(
                    title: "Payout",
                    onTap: () async {
                      await sidebarcontroller.getPayoutTable();
                      sidebarcontroller.toRoute(5);
                      context.go(PagePath.payouts);
                    },
                    header: const PayoutHeaderWidget(),
                    body: PayoutBodyWidget(
                      payoutList: controller.payoutObject,
                    ),
                  )),
              SizedBox(
                  width: 770,
                  height: 350,
                  child: CommonListWidget(
                    onTap: () async {
                      await sidebarcontroller.getParentTable();
                      sidebarcontroller.toRoute(1);

                      context.go(PagePath.userParents);
                    },
                    title: "Recent Parents",
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
                    onTap: () async {
                      await sidebarcontroller.getContributorsTable();
                      sidebarcontroller.toRoute(4);
                      context.go(PagePath.contrbutions);
                    },
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

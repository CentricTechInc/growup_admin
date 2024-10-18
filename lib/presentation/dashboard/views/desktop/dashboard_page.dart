import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/active_user__chart_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/contributions_chart_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/dashboard_stats_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/top_gifting_chart_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(
            text: 'Hi John!',
            fontSize: 24,
            weight: FontWeight.w700,
          ),
          const VerticalSpacing(30),
          const DashboardStatsBarWidget(title: [], subTitle: []),
          const VerticalSpacing(30),
          SizedBox(
            height: context.height / 3,
            child: const Row(
              children: [
                Expanded(flex: 2, child: ActiveUserChartWidget()),
                HorizontalSpacing(30),
                Expanded(child: TopGiftingChartWidget()),
                HorizontalSpacing(30),
                Expanded(child: ContributionsChartWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

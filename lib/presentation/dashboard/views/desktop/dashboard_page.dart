import 'package:flutter/material.dart';
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
    return const SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Hi John!',
            fontSize: 24,
            weight: FontWeight.w700,
          ),
          VerticalSpacing(20),
          DashboardStatsBarWidget(title: [], subTitle: []),
          VerticalSpacing(20),
          SizedBox(
            height: 350,
            child: Row(
              children: [
                Expanded(
                    child:
                        SizedBox(height: 350, child: ActiveUserChartWidget())),
                HorizontalSpacing(30),
                Expanded(child: TopGiftingChartWidget()),
                HorizontalSpacing(30),
                Expanded(child: ContributionsChartWidget())
              ],
            ),
          ),
          VerticalSpacing(20),
          SizedBox(
            height: 350,
            child: Row(
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

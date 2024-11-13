import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActiveUserChartWidget extends StatelessWidget {
  const ActiveUserChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return CommonChartWidget(
        title: 'Recent Active Users',
        arryList: controller.userFilters,
        selectedItem: controller.selectedUserFilter,
        onChanged: (p0) {
          controller.selectedUserFilter = p0 ?? '';
          controller.getActiveUsersChart();
          controller.update();
        },
        totalStats: '${controller.activeUsersChartDto?.data?.totalUsers ?? 0}',
        legend: Row(
          children: [
            Image.asset(
              height: 25,
              width: 25,
              Assets.userContributiorIcon,
              color: AppColors.secondary,
            ),
            const CommonText(
              text: 'Contributer',
              fontSize: 12,
              weight: FontWeight.w500,
            ),
            const HorizontalSpacing(15),
            Image.asset(
              height: 25,
              width: 25,
              Assets.userParentIcon,
              color: AppColors.primary,
            ),
            const CommonText(
              text: 'Parent',
              fontSize: 12,
              weight: FontWeight.w500,
            ),
          ],
        ),
        child: Expanded(
          child: controller.isUserLoading
              ? const Center(child: CircularProgressIndicator())
              : SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis: const NumericAxis(),
                  trackballBehavior: TrackballBehavior(
                    enable: true, // Enable the trackball
                    activationMode:
                        ActivationMode.singleTap, // Activate on single tap
                  ),
                  series: <SplineSeries<ChartData, String>>[
                    SplineSeries<ChartData, String>(
                      name: 'Contributor',
                      dataSource: controller.contributorData,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.blue,
                      width: 2,
                      splineType: SplineType.natural,
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                      ),
                      dashArray: const [5, 5],
                    ),
                    SplineSeries<ChartData, String>(
                      splineType: SplineType.natural,
                      name: 'Parent',
                      dataSource: controller.parentData,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.green,
                      width: 2,
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                      ),
                      dashArray: const [5, 5],
                    ),
                  ],
                ),
        ),
      );
    });
  }
}

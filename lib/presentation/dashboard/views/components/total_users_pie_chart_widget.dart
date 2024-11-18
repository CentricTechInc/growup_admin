import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalUsersPieChartWidget extends StatelessWidget {
  const TotalUsersPieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return CommonChartWidget(
        title: 'Total Users',
        arryList: controller.totalUsersFilters,
        selectedItem: controller.selectedTotalUsersFilter,
        onChanged: (value) {
          controller.selectedTotalUsersFilter = value ?? '';
          controller.getTotalUsersChart();
          controller.update();
        },
        totalStats:
            controller.totalUsersChartDto!.data!.totalUsers!.toInt().toString(),
        child: Expanded(
          child: controller.totalUsersLoading
              ? const Center(child: CircularProgressIndicator())
              : SfCircularChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  legend: const Legend(
                      isVisible: true, position: LegendPosition.bottom),
                  series: <CircularSeries>[
                    PieSeries<ChartData, String>(
                      dataSource: [
                        ChartData(
                            'Contributor',
                            double.parse(
                                '${controller.totalUsersChartDto?.data?.contributors ?? '0'}')),
                        ChartData(
                            'Parent',
                            double.parse(
                              '${controller.totalUsersChartDto?.data?.parents ?? '0'}',
                            )),
                      ],
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, color: Colors.white),
                      startAngle: 270,
                      // Start at the bottom
                      endAngle: 90,
                      // End at the top, creating a half-pie
                      radius: '150%',
                    ),
                  ],
                ),
        ),
      );
    });
  }
}

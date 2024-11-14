import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/data/dto/top_contributors_chart_dto.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContributionsChartWidget extends StatelessWidget {
  const ContributionsChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return CommonChartWidget(
        arryList: controller.contributorFilters,
        selectedItem: controller.selectedContributorFilter,
        onChanged: (p0) {
          controller.selectedContributorFilter = p0 ?? '';
          controller.getTopContributorsChart();
          controller.update();
        },
        title: 'Contributions',
        totalStats: '\$${controller.topContributorsChartDto?.data?.total ?? 0}',
        child: Expanded(
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              minimum: 0,
              maximum: 150,
              interval: 30,
            ),
            legend: const Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
            ),
            series: <CartesianSeries<ContributorChartData, String>>[
              BarSeries<ContributorChartData, String>(
                dataSource: controller.topContributorChartData,
                xValueMapper: (ContributorChartData data, _) => data.month,
                yValueMapper: (ContributorChartData data, _) =>
                    data.contributor,
                name: 'Contributors',
                color: Colors.green,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
              BarSeries<ContributorChartData, String>(
                dataSource: controller.topContributorChartData,
                xValueMapper: (ContributorChartData data, _) => data.month,
                yValueMapper: (ContributorChartData data, _) => data.parent,
                name: 'Parents',
                color: Colors.teal,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      );
    });
  }
}

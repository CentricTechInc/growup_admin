import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContributionFrequencyWidget extends StatelessWidget {
  const ContributionFrequencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return CommonChartWidget(
        arryList: controller.contributionFrequencyFilters,
        selectedItem: controller.selectedContributionFrequencyFilter,
        onChanged: (p0) {
          controller.selectedContributionFrequencyFilter = p0 ?? '';
          controller.getContributionFrequencyChart();
          controller.update();
        },
        title: 'Contribution Frequency',
        totalStats:
            controller.contributionFrequencyChartDto?.data?.totalCOntribution ??
                '',
        child: Expanded(
          child: controller.contributionFrequencyLoading
              ? const Center(child: CircularProgressIndicator())
              : SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  borderWidth: 0,
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis: const NumericAxis(
                    minimum: 0,
                    interval: 10,
                    maximum: 100,
                    axisLine: AxisLine(
                      width: 1,
                    ),
                    labelFormat: '{value}%',
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  legend: const Legend(
                      toggleSeriesVisibility: false,
                      isVisible: true,
                      position: LegendPosition.bottom),
                  series: [
                    StackedBarSeries<ChartData, String>(
                      dataSource: controller.onceContributionFrequencyList,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.red[900],
                      name: 'Once',
                    ),
                    StackedBarSeries<ChartData, String>(
                      dataSource: controller.weeklyContributionFrequencyList,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.yellow,
                      name: 'Weekly',
                    ),
                    StackedBarSeries<ChartData, String>(
                      dataSource: controller.monthlyContributionFrequencyList,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.green,
                      name: 'Monthly',
                    ),
                    StackedBarSeries<ChartData, String>(
                      dataSource: controller.quaterlyContributionFrequencyList,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.blue,
                      name: 'Quarterly',
                    ),
                  ],
                ),
        ),
      );
    });
  }
}

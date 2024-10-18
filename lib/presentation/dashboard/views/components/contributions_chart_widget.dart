import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContributionsChartWidget extends StatelessWidget {
  const ContributionsChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonChartWidget(
      title: 'Contributions',
      totalStats: '\$ 15,000.00',
      child: Expanded(
        child: SfCartesianChart(
          legend: const Legend(isVisible: true),
          primaryXAxis: const CategoryAxis(),
// X-axis is categorical (for bar labels)
          primaryYAxis: const NumericAxis(),
// Y-axis is numeric (for bar values)
          series: <BarSeries<int, double>>[
// First bar series (Parent)
            BarSeries<int, double>(
              legendIconType: LegendIconType.circle,
              dataSource: const <int>[0, 5, 2, 7, 1],
              xValueMapper: (int datum, int index) {
                return index
                    .toDouble(); // The categories or labels for the bars
              },
              yValueMapper: (int datum, int index) {
                return datum * 0.5; // Values for the bars
              },
              name: 'Parents',
              pointColorMapper: (int datum, int index) {
// Assign different colors for each bar
                return AppColors.primaryLight;
              },
              dataLabelSettings: const DataLabelSettings(
                isVisible: true, // Show labels on the bars
              ),
            ),

// Second bar series (Contributor)
            BarSeries<int, double>(
              legendIconType: LegendIconType.circle,
              dataSource: const <int>[2, 3, 1, 10, 4],
              xValueMapper: (int datum, int index) {
                return index
                    .toDouble(); // The categories or labels for the bars
              },
              yValueMapper: (int datum, int index) {
                return datum * 0.7; // Values for the bars
              },
              name: 'Contributors',
              pointColorMapper: (int datum, int index) {
// Assign different colors for each bar
                return AppColors.secondary;
              },
              dataLabelSettings: const DataLabelSettings(
                isVisible: false, // Show labels on the bars
              ),
            ),
          ],
        ),
      ),
    );
  }
}

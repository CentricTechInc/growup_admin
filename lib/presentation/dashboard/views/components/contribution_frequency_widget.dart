import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContributionFrequencyWidget extends StatelessWidget {
  const ContributionFrequencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonChartWidget(
      title: 'Total Users',
      totalStats: '2100',
      child: Expanded(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            minimum: -0,
            maximum: 100,
            // interval: 20,
            axisLine: AxisLine(width: 1),
            majorGridLines: MajorGridLines(width: 0),
          ),
          legend: Legend(isVisible: true, position: LegendPosition.bottom),
          series: [
            StackedBarSeries<ChartData, String>(
              dataSource: [
                ChartData('Jan', 20),
                ChartData('Feb', 25),
                ChartData('Mar', 30),
                ChartData('Apr', 10),
              ],
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.value,
              color: Colors.red,
              name: 'Segment 1',
            ),
            StackedBarSeries<ChartData, String>(
              dataSource: [
                ChartData('Jan', 20),
                ChartData('Feb', 25),
                ChartData('Mar', 30),
                ChartData('Apr', 10),
              ],
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.value,
              color: Colors.yellow,
              name: 'Segment 2',
            ),
            StackedBarSeries<ChartData, String>(
              dataSource: [
                ChartData('Jan', 20),
                ChartData('Feb', 25),
                ChartData('Mar', 30),
                ChartData('Apr', 10),
              ],
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.value,
              color: Colors.green,
              name: 'Segment 3',
            ),
            StackedBarSeries<ChartData, String>(
              dataSource: [
                ChartData('Jan', 20),
                ChartData('Feb', 25),
                ChartData('Mar', 30),
                ChartData('Apr', 10),
              ],
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.value,
              color: Colors.blue,
              name: 'Segment 4',
            ),
          ],
        ),
      ),
    );
  }
}

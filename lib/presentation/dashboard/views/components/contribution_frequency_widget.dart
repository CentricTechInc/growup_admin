import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class  ContributionFrequencyWidget extends StatelessWidget {
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
            StackedBarSeries<Map<String, dynamic>, String>(
              dataSource: [
                {'month': 'Jan', 'value': 20},
                {'month': 'Feb', 'value': 30},
                {'month': 'Mar', 'value': 25},
                {'month': 'Apr', 'value': 10},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['month'],
              yValueMapper: (Map<String, dynamic> data, _) => data['value'],
              color: Colors.red,
              name: 'Segment 1',
            ),
            StackedBarSeries<Map<String, dynamic>, String>(
              dataSource: [
                {'month': 'Jan', 'value': 15},
                {'month': 'Feb', 'value': 10},
                {'month': 'Mar', 'value': 20},
                {'month': 'Apr', 'value': 15},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['month'],
              yValueMapper: (Map<String, dynamic> data, _) => data['value'],
              color: Colors.yellow,
              name: 'Segment 2',
            ),
            StackedBarSeries<Map<String, dynamic>, String>(
              dataSource: [
                {'month': 'Jan', 'value': 10},
                {'month': 'Feb', 'value': 20},
                {'month': 'Mar', 'value': 15},
                {'month': 'Apr', 'value': 25},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['month'],
              yValueMapper: (Map<String, dynamic> data, _) => data['value'],
              color: Colors.green,
              name: 'Segment 3',
            ),
            StackedBarSeries<Map<String, dynamic>, String>(
              dataSource: [
                {'month': 'Jan', 'value': 5},
                {'month': 'Feb', 'value': 15},
                {'month': 'Mar', 'value': 10},
                {'month': 'Apr', 'value': 20},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['month'],
              yValueMapper: (Map<String, dynamic> data, _) => data['value'],
              color: Colors.blue,
              name: 'Segment 4',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContributionAndPayoutRatioChartWidget extends StatelessWidget {
  const ContributionAndPayoutRatioChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonChartWidget(
      title: 'Contribution & Payout Ratio',
      totalStats: '\$300000',
      child: Expanded(
        child: SfCartesianChart(
          // title: ChartTitle(text: 'Contributions & Payout Ratio'),
          primaryXAxis: CategoryAxis(),
          // primaryYAxis: NumericAxis(minimum: -40, maximum: 40, interval: 20),
          // annotations: <CartesianChartAnnotation>[],
          // series: <CartesianSeries>[
          //   StackedColumnSeries<SalesData, String>(
          //     dataSource: [
          //       SalesData('Jan', 10, -20),
          //       SalesData('Feb', 20, -15),
          //       SalesData('Mar', 30, 10),
          //       SalesData('june', -10, 25),
          //       SalesData('July', -10, 25),
          //       SalesData('Aug', -10, 25),
          //     ],
          //     xValueMapper: (SalesData data, _) => data.month,
          //     yValueMapper: (SalesData data, _) => data.value1,
          //     color: Colors.teal,
          //   ),
          //   StackedColumnSeries<SalesData, String>(
          //     dataSource: [
          //       SalesData('Jan', 10, -20),
          //       SalesData('Feb', 20, -15),
          //       SalesData('Mar', 30, 10),
          //       SalesData('Apr', -10, 25),
          //     ],
          //     xValueMapper: (SalesData data, _) => data.month,
          //     yValueMapper: (SalesData data, _) => data.value2,
          //     color: Colors.green,
          //   ),
          // ],
        ),
      ),
    );
  }
}

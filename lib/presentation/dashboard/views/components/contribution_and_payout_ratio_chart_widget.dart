import 'package:flutter/material.dart';
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
          primaryXAxis: const CategoryAxis(),
          primaryYAxis: const NumericAxis(minimum: -40, maximum: 40),
          trackballBehavior: TrackballBehavior(),
          series: <StackedBarSeries>[
            StackedBarSeries<Map<String, dynamic>, String>(
              dataSource: const [
                {'month': 'Jan', 'contribution': 10},
                {'month': 'Feb', 'contribution': 25},
                {'month': 'Mar', 'contribution': 20},
                {'month': 'Apr', 'contribution': 15},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['month'],
              yValueMapper: (Map<String, dynamic> data, _) =>
                  data['contribution'],
              color: Colors.teal,
              name: 'Contribution',
            ),
            StackedBarSeries<Map<String, dynamic>, String>(
              dataSource: const [
                {'month': 'Jan', 'payout': -10},
                {'month': 'Feb', 'payout': -35},
                {'month': 'Mar', 'payout': -15},
                {'month': 'Apr', 'payout': -25},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['month'],
              yValueMapper: (Map<String, dynamic> data, _) => data['payout'],
              color: Colors.green,
              name: 'Payout',
            ),
          ],
        ),
      ),
    );
  }
}

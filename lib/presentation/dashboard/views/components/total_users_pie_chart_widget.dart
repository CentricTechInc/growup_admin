import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class  TotalUsersPieChartWidget extends StatelessWidget {
  const TotalUsersPieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonChartWidget(
      title: 'Total Users',
      totalStats: '2100',
      child: Expanded(
        child: SfCircularChart(
          legend: Legend(isVisible: true, position: LegendPosition.top),
          series: <PieSeries<Map<String, dynamic>, String>>[
            PieSeries<Map<String, dynamic>, String>(
              dataSource: [
                {'category': 'Contribution', 'value': 70, 'color': Colors.teal},
                {'category': 'Payout', 'value': 85, 'color': Colors.green},
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['category'],
              yValueMapper: (Map<String, dynamic> data, _) => data['value'],
              dataLabelMapper: (Map<String, dynamic> data, _) =>
              '${data['category']}: ${data['value']}',
              dataLabelSettings: DataLabelSettings(isVisible: true),
              startAngle: 270,
              // Start at the bottom
              endAngle: 90,
              // End at the top, creating a half-pie
              radius: '80%',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopGiftingChartWidget extends StatelessWidget {
  const TopGiftingChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonChartWidget(
        title: 'Top Giftings',
        totalStats: '5,000.00',
        child: SfCircularChart(
          legend: const Legend(isVisible: true),
          series: <PieSeries<int, double>>[
            // First pie series (Parent)
            PieSeries<int, double>(
              legendIconType: LegendIconType.circle,
              explode: true,
              dataSource: const <int>[3, 1, 5],
              xValueMapper: (int datum, int index) {
                return index
                    .toDouble(); // The categories or labels for the pie slices
              },
              yValueMapper: (int datum, int index) {
                return datum * 0.5; // Values for the pie slices
              },
              name: 'Parent',
              pointColorMapper: (int datum, int index) {
                // Assign different colors for each slice
                return [
                  AppColors.primaryLight,
                  AppColors.secondary,
                  AppColors.pinkFlesh,
                ][index];
              },
              dataLabelSettings: const DataLabelSettings(
                textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cabin',
                    color: AppColors.white),
                isVisible: true, // Show data labels
              ),
            ),
          ],
        ));
  }
}

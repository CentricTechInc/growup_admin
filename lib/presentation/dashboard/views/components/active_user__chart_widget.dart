import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActiveUserChartWidget extends StatelessWidget {
  const ActiveUserChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonChartWidget(
      title: 'Recent Active Users',
      totalStats: '150',
      legend: Row(
        children: [
          Image.asset(
            Assets.userContributiorIcon,
            scale: 1.5,
            color: AppColors.secondary,
          ),
          const CommonText(
            text: 'Contributer',
            fontSize: 12,
            weight: FontWeight.w500,
          ),
          const HorizontalSpacing(15),
          Image.asset(
            Assets.userParentIcon,
            scale: 1.5,
            color: AppColors.primary,
          ),
          const CommonText(
            text: 'Parent',
            fontSize: 12,
            weight: FontWeight.w500,
          ),
        ],
      ),
      child: Expanded(
        child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          primaryYAxis: const NumericAxis(),
          trackballBehavior: TrackballBehavior(
            enable: true, // Enable the trackball
            activationMode: ActivationMode.singleTap, // Activate on single tap
          ),
          series: <SplineSeries<int, double>>[
            // First dotted curved line (Curve 1)
            SplineSeries<int, double>(
              color: AppColors.secondary,
              dataSource: const <int>[0, 5, 2, 7, 1],
              xValueMapper: (int datum, int index) {
                return index.toDouble();
              },
              yValueMapper: (int datum, int index) {
                return datum * 0.5; // Curve 1 data points
              },
              splineType: SplineType.natural,
              // Smooth curve
              dashArray: const <double>[5, 5],
              // Dotted line effect
              name: 'Parent',
              markerSettings: const MarkerSettings(
                isVisible: true, // Show markers at data points
              ),
            ),

            // Second dotted curved line (Curve 2)
            SplineSeries<int, double>(
              color: AppColors.primaryLight,
              dataSource: const <int>[4, 3, 1, 10, 4],
              xValueMapper: (int datum, int index) {
                return index.toDouble();
              },
              yValueMapper: (int datum, int index) {
                return datum * 0.7; // Curve 2 data points
              },
              splineType: SplineType.natural,
              // Smooth curve
              dashArray: const <double>[5, 5],
              // Dotted line effect
              name: 'Contributor',
              markerSettings: const MarkerSettings(
                isVisible: true, // Show markers at data points
              ),
            ),
          ],
        ),
      ),
    );
  }
}

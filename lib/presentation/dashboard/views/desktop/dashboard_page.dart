import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Hi John!',
            fontSize: 24,
            weight: FontWeight.w700,
          ),
          VerticalSpacing(30),
          StatsBarWidget(title: [], subTitle: []),
          VerticalSpacing(30),
          Row(
            children: [
              Expanded(flex: 2, child: ActiveUserChartWidget()),
              HorizontalSpacing(30),
              Expanded(child: TopGiftingWidget()),
              HorizontalSpacing(30),
              Expanded(child: ContributionsWidget())
            ],
          ),
        ],
      ),
    );
  }
}

class TopGiftingWidget extends StatelessWidget {
  const TopGiftingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 2,
      // width: context.width / 4,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CommonText(
                  text: 'Top Giftings',
                  weight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Expanded(
                child: CommonDropDownWidget(
                  selectedItem: 'This Week',
                  onChanged: (value) {},
                  arryList: const ['This Week', 'Last Week'],
                ),
              ),
            ],
          ),
          const CommonText(
            text: '5,000.00',
            fontSize: 32,
            weight: FontWeight.w400,
            color: AppColors.primary,
          ),
          Expanded(
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
                      AppColors.primary,
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
            ),
          )
        ],
      ),
    );
  }
}

class ContributionsWidget extends StatelessWidget {
  const ContributionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 2,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CommonText(
                  text: 'Contributions',
                  weight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Expanded(
                child: CommonDropDownWidget(
                  selectedItem: 'Quarterly',
                  onChanged: (value) {},
                  arryList: const ['Quarterly', 'Monthly'],
                ),
              ),
            ],
          ),
          const CommonText(
            text: '15,000.00',
            fontSize: 32,
            weight: FontWeight.w400,
            color: AppColors.primary,
          ),
          Expanded(
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
                  dataSource: <int>[0, 5, 2, 7, 1],
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
                    return AppColors.primary;
                  },
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true, // Show labels on the bars
                  ),
                ),

                // Second bar series (Contributor)
                BarSeries<int, double>(
                  legendIconType: LegendIconType.circle,
                  dataSource: <int>[2, 3, 1, 10, 4],
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
          )
        ],
      ),
    );
  }
}

class ActiveUserChartWidget extends StatelessWidget {
  const ActiveUserChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 2,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CommonText(
                  text: 'Recent Active User',
                  weight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Expanded(
                child: CommonDropDownWidget(
                  selectedItem: 'This Week',
                  onChanged: (value) {},
                  arryList: const ['This Week', 'Last Week'],
                ),
              ),
            ],
          ),
          const CommonText(
            text: '150',
            fontSize: 32,
            weight: FontWeight.w400,
            color: AppColors.primary,
          ),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(),
              trackballBehavior: TrackballBehavior(
                enable: true, // Enable the trackball
                activationMode:
                    ActivationMode.singleTap, // Activate on single tap
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
                  color: AppColors.primary,
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
          const VerticalSpacing(15),
          Row(
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
          )
        ],
      ),
    );
  }
}

class StatsBarWidget extends StatelessWidget {
  const StatsBarWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final List<String> title;
  final List<String> subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Visibility(
              visible: index != 0,
              replacement: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalSpacing(30),
                  CommonText(
                    text: 'Total Active Users',
                    fontSize: 16,
                    weight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                  VerticalSpacing(10),
                  CommonText(
                    text: '1200',
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: context.height * 0.08,
                    child: const CommonVerticalDivider(),
                  ),
                  const HorizontalSpacing(30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HorizontalSpacing(30),
                      CommonText(
                        text: 'Total Active Users',
                        fontSize: 16,
                        weight: FontWeight.w500,
                        color: AppColors.secondaryText,
                      ),
                      VerticalSpacing(10),
                      CommonText(
                        text: '1200',
                        fontSize: 16,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

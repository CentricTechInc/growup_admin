import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopGiftingChartWidget extends StatelessWidget {
  const TopGiftingChartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return CommonChartWidget(
          title: 'Top Giftings',
          arryList: controller.giftFilters,
          selectedItem: controller.selectedGiftFilter,
          onChanged: (p0) {
            controller.selectedGiftFilter = p0 ?? '';
            controller.getTopGiftingChart();
            controller.update();
          },
          totalStats:
              '\$${controller.topGiftingChartDto?.data?.totalContributions?.toStringAsFixed(2)}',
          child: Expanded(
            child: controller.isGiftLoading
                ? const Center(child: CircularProgressIndicator())
                : SfCircularChart(
                    tooltipBehavior: TooltipBehavior(enable: true),
                    legend: const Legend(isVisible: true),
                    series: <PieSeries<ChartData, String>>[
                      PieSeries<ChartData, String>(
                        enableTooltip: true,
                        legendIconType: LegendIconType.circle,
                        explode: true,
                        dataSource: controller.topGiftingData,
                        xValueMapper: (ChartData data, _) => data.month,
                        yValueMapper: (ChartData data, _) => data.value,
                        pointColorMapper: (ChartData data, index) {
                          return [
                            AppColors.primaryLight,
                            AppColors.secondary,
                            AppColors.pinkFlesh,
                          ][index];
                        },
                        name: 'Parent',
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.inside,
                          textStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
          ));
    });
  }
}

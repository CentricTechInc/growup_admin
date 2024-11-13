import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonChartWidget extends StatelessWidget {
  const CommonChartWidget(
      {super.key,
      required this.child,
      this.legend,
      required this.title,
      required this.totalStats,
      this.selectedItem,
      this.onChanged,
      this.arryList});

  final String title;
  final String totalStats;
  final Widget child;
  final Widget? legend;
  final String? selectedItem;
  final dynamic Function(String?)? onChanged;
  final List<String>? arryList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 2,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CommonText(
                  text: title,
                  weight: FontWeight.w500,
                  fontSize: 16,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                width: 150,
                child: CommonDropDownWidget<String>(
                  selectedItem: selectedItem ?? 'This Week',
                  onChanged: onChanged,
                  arryList: arryList ?? [],
                ),
              ),
            ],
          ),
          CommonText(
            text: totalStats,
            fontSize: 32,
            weight: FontWeight.w400,
            color: AppColors.primary,
          ),
          const VerticalSpacing(5),
          child,
          if (legend != null) const VerticalSpacing(15),
          legend ?? const SizedBox(),
        ],
      ),
    );
  }
}

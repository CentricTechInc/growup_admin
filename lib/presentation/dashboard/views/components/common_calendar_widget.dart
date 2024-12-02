import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/calendar_selection_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CommonCalendarWidget extends StatelessWidget {
  const CommonCalendarWidget(
      {super.key, required this.onTap, this.dateSelectionOnTap});

  final Function(int)? onTap;
  final Function(Object?)? dateSelectionOnTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return AlertDialog(
        backgroundColor: AppColors.transparent,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (index) => CalendarSelectionCard(
                    title: [
                      'Today',
                      'Last week',
                      'Last month',
                      'Last 90 days',
                      'Custom date'
                    ][index],
                    isSelected: index == controller.calendarSelectedIndex,
                    onTap: () {
                      if (onTap != null) {
                        controller.isCalendarSelectable = index == 4;
                        switch (index) {
                          case 0:
                            controller.period = CalendarPeriod.today;
                            break;
                          case 1:
                            controller.period = CalendarPeriod.lastweek;
                            break;
                          case 2:
                            controller.period = CalendarPeriod.lastmonth;
                            break;
                          case 3:
                            controller.period = CalendarPeriod.last90days;
                            break;
                          case 4:
                            controller.period = CalendarPeriod.customdate;
                            break;
                        }
                        onTap!(index);
                        controller.update();
                      }
                    },
                  ),
                ),
              ),
            ),
            const HorizontalSpacing(20),
            Container(
              width: Responsive.isDesktop(context) ?  context.width * 0.3 : context.width * 0.5,
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: !controller.isCalendarSelectable,
                      child: SfDateRangePicker(
                        controller: controller.dateRangeController,
                        rangeSelectionColor: AppColors.black.withOpacity(0.1),
                        headerStyle: const DateRangePickerHeaderStyle(
                            backgroundColor: AppColors.white),
                        todayHighlightColor: AppColors.secondaryText,
                        selectionColor: AppColors.black,
                        backgroundColor: AppColors.white,
                        selectionMode: DateRangePickerSelectionMode.range,
                        startRangeSelectionColor: AppColors.black,
                        endRangeSelectionColor: AppColors.black,
                        showActionButtons: controller.calendarSelectedIndex == 4
                            ? true
                            : false,
                        onSubmit: dateSelectionOnTap,
                        onCancel: () {
                          controller.period = null;
                          controller.dateRangeController.dispose();
                          context.pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

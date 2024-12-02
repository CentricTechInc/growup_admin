import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_calendar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/giftings_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/page_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class GiftingsPage extends StatelessWidget {
  const GiftingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              hintText: 'Search by Gifting title',
              searchController: controller.giftingSearchController,
              searchCancelOnTap: () async {
                controller.giftingSearchController.clear();
                //
                await controller.getGiftingTable();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.getGiftingTable();
                  controller.update();
                });
              },
              label: 'Giftings',
              exportOnTap: () async {
                await controller.exportGiftTable();
              },
              calendarselectedIndex: controller.calendarSelectedIndex,
              calendarlabel: controller.period?.name ?? 'Select',
              calendarOnTap: () {
                controller.dateRangeController = DateRangePickerController();
                controller.isCalendarSelectable = false;
                showGeneralDialog(
                  context: context,
                  barrierLabel: 'label',
                  barrierDismissible: true,
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -1),
                        end: const Offset(0, 0),
                      ).animate(anim1),
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      CommonCalendarWidget(
                    onTap: (index) async {
                      controller.giftingsPageNo = 1;
                      controller.calendarSelectedIndex = index;
                      if (controller.period == CalendarPeriod.customdate) {
                        return;
                      }
                      await controller.giftingDatefilter(
                          period: controller.period);

                      context.pop();
                    },
                    dateSelectionOnTap: (_) async {
                      controller.period = null;
                      controller.giftingsPageNo = 1;
                      await controller.giftingDatefilter(
                        dateTime: DateRangeModel(
                          from: controller
                              .dateRangeController.selectedRange?.startDate,
                          to: controller
                              .dateRangeController.selectedRange?.endDate,
                        ),
                      );
                      context.pop();
                      controller.dateRangeController.dispose();
                    },
                  ),
                );
              },
            ),
            const VerticalSpacing(30),
            const GiftingTableHeader(
              // value: false,
              titleList: [
                'Gifting ID',
                'Gifting Title',
                'Posted By',

                /// [GetBuilder] to get the user details from the [SideBarController]
                /// and to update the UI when the user details change.
                'Benefeciary Name',
                'Date & Time',
                'Giftings Total',
                'Status'
              ],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.giftingModelList.isEmpty
                    ? 1
                    : controller.giftingModelList.length,
                itemBuilder: (context, index) =>
                    controller.giftingModelList.isEmpty
                        ? const NoDataFound(title: 'No record found!')
                        : GiftingsTableBody(
                            model: controller.giftingModelList[index],
                            onTap: () async {
                              final userId =
                                  controller.giftingModelList[index].userId;
                              await controller.getParentDetail(userId ?? -1);
                              await controller.getGiftDetail(
                                  userId.toString(), 'Active');
                              await controller.getUserBenes(
                                userId.toString(),
                              );
                              controller.liveGiftingSelectedIndex = 0;
                              controller.userParentSelectedIndex = 0;
                              globalContext?.push(
                                  '${PagePath.giftings}${PagePath.parentDetails.toRoute}?isParent=${true}');
                            },
                          ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            if (controller.giftingSearchController.text.isEmpty)
              CommonPagerWidget(
                currentPage: controller.giftingsPageNo,
                totalPage: ((controller.elementCount == 0
                            ? 1
                            : controller.elementCount) /
                        controller.pageSize)
                    .ceil(),
                onPageChanged: (page) async {
                  controller.giftingsPageNo = page;
                  if (controller.period != null) {
                    if (controller.period == CalendarPeriod.customdate) {
                      await controller.giftingDatefilter(
                        dateTime: DateRangeModel(
                          from: controller
                              .dateRangeController.selectedRange?.startDate,
                          to: controller
                              .dateRangeController.selectedRange?.endDate,
                        ),
                      );
                    } else {
                      await controller.giftingDatefilter(
                          period: controller.period);
                    }
                  } else {
                    await controller.getGiftingTable();
                  }
                  controller.update();
                },
              ),
          ],
        ),
      );
    });
  }
}

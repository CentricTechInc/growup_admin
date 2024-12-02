import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_calendar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/page_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class UserParentPage extends StatelessWidget {
  const UserParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GetBuilder<SideBarController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              label: 'Parents',
              searchController: controller.parentTableSearchController,
              searchCancelOnTap: () async {
                await controller.getParentTable();
                controller.parentTableSearchController.clear();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.searchParentTable(val);
                  controller.update();
                });
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
                      controller.calendarSelectedIndex = index;
                      if (controller.period == CalendarPeriod.customdate) {
                        return;
                      }
                      controller.parentPageNo = 1;
                      await controller.parentDatefilter(
                          period: controller.period);

                      context.pop();
                    },
                    dateSelectionOnTap: (_) async {
                      controller.parentPageNo = 1;
                      await controller.parentDatefilter(
                        dateTime: DateRangeModel(
                          from: controller
                              .dateRangeController.selectedRange?.startDate,
                          to: controller
                              .dateRangeController.selectedRange?.endDate,
                        ),
                      );
                      controller.dateRangeController.dispose();
                      context.pop();
                    },
                  ),
                );
              },
              exportOnTap: () async {
                await controller.exportTable('Parent');
              },
            ),
            const VerticalSpacing(30),
            const ParentTableHeader(
              // value: false,
              titleList: ['User ID', 'Name', 'Email', 'Phone'],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.userParentModelList.isEmpty
                    ? 1
                    : controller.userParentModelList.length,
                itemBuilder: (context, index) => controller
                        .userParentModelList.isEmpty
                    ? const NoDataFound(title: 'No record found!')
                    : ParentTableBody(
                        onTap: () async {
                          await controller.getParentDetail(
                              controller.userParentModelList[index].id ?? 0);
                          await controller.getGiftDetail(
                              controller.userParentModelList[index].id
                                  .toString(),
                              'Active');
                          await controller.getUserBenes(controller
                              .userParentModelList[index].id
                              .toString());
                          controller.userParentSelectedIndex = 0;
                          controller.liveGiftingSelectedIndex = 0;
                          context.push(
                              '${PagePath.userParents}${PagePath.parentDetails.toRoute}?isParent=${true}');
                        },
                        model: controller.userParentModelList[index],
                      ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            if (controller.parentTableSearchController.text.isEmpty)
              CommonPagerWidget(
                currentPage: controller.parentPageNo,
                totalPage: ((controller.elementCount == 0
                            ? 1
                            : controller.elementCount) /
                        controller.pageSize)
                    .ceil(),
                onPageChanged: (page) async {
                  controller.parentPageNo = page;
                  if (controller.period != null) {
                    if (controller.period == CalendarPeriod.customdate) {
                      await controller.parentDatefilter(
                        dateTime: DateRangeModel(
                          from: controller
                              .dateRangeController.selectedRange?.startDate,
                          to: controller
                              .dateRangeController.selectedRange?.endDate,
                        ),
                      );
                    } else {
                      await controller.parentDatefilter(
                          period: controller.period);
                    }
                  } else {
                    await controller.getParentTable();
                  }
                  controller.update();
                },
              ),
          ],
        );
      }),
    );
  }
}

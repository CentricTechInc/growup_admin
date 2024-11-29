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

class UserContributionPage extends StatelessWidget {
  const UserContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GetBuilder<SideBarController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              label: 'Contributors',
              searchController: controller.contributorTableSearchController,
              searchCancelOnTap: () async {
                await controller.getContributorsTable();
                controller.contributorTableSearchController.clear();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.searchContributorsTable(val);
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
                      controller.contributorPageNo = 1;
                      if (controller.period == CalendarPeriod.customdate) {
                        return;
                      }
                      await controller.contributorsDatefilter(
                          period: controller.period);

                      context.pop();
                    },
                    dateSelectionOnTap: (_) async {
                      controller.period = null;
                      controller.contributorPageNo = 1;
                      await controller.contributorsDatefilter(
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
              exportOnTap: () async {
                await controller.exportTable('Contributor');
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
                itemCount: controller.userContributorModelList.isEmpty
                    ? 1
                    : controller.userContributorModelList.length,
                itemBuilder: (context, index) =>
                    controller.userContributorModelList.isEmpty
                        ? const NoDataFound(title: 'No record found!')
                        : ParentTableBody(
                            onTap: () async {
                              await controller.getParentDetail(controller
                                      .userContributorModelList[index].id ??
                                  0);
                              await controller.getActivity(controller
                                  .userContributorModelList[index].id
                                  .toString());
                              // await controller.getGiftDetail(
                              //     controller.userContributorModelList[index].id
                              //             .toString() ??
                              //         '',
                              //     'Active');
                              context.push(
                                  '${PagePath.userParents}${PagePath.parentDetails.toRoute}?isParent=${false}');
                            },
                            model: controller.userContributorModelList[index],
                          ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            if (controller.contributorTableSearchController.text.isEmpty)
              CommonPagerWidget(
                currentPage: controller.contributorPageNo,
                totalPage: ((controller.elementCount == 0
                            ? 1
                            : controller.elementCount) /
                        10)
                    .ceil(),
                onPageChanged: (page) async {
                  controller.contributorPageNo = page;
                  if (controller.period != null) {
                    if (controller.period == CalendarPeriod.customdate) {
                      await controller.contributorsDatefilter(
                        dateTime: DateRangeModel(
                          from: controller
                              .dateRangeController.selectedRange?.startDate,
                          to: controller
                              .dateRangeController.selectedRange?.endDate,
                        ),
                      );
                    } else {
                      await controller.contributorsDatefilter(
                          period: controller.period);
                    }
                  } else {
                    await controller.getContributorsTable();
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

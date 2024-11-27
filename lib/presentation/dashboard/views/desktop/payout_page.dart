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
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/page_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payout_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PayoutPage extends StatelessWidget {
  const PayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              hintText: 'Search by title, name',
              label: 'Payout',
              searchController: controller.payoutSearchController,
              searchCancelOnTap: () async {
                controller.payoutSearchController.clear();
                //
                await controller.getPayoutTable();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.getPayoutTable();
                  controller.update();
                });
              },
              calendarselectedIndex: controller.calendarSelectedIndex,
              calendarlabel: controller.period?.name ?? 'Select',
              calendarOnTap: () {
                controller.calendarSelectedIndex = 0;
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
                          await controller.parentDatefilter(
                              period: controller.period);

                          context.pop();
                        },
                        dateSelectionOnTap: (_) async {
                          controller.period = null;
                          await controller.parentDatefilter(
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
            const PayoutTableHeader(
              // value: false,
              titleList: [
                'Payment ID',
                'Gifting Title',
                'Parents Name',
                'Benefeciary Name',
                'Date & Time',
                'Payout Amount',
              ],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.payoutModelList.isEmpty
                    ? 1
                    : controller.payoutModelList.length,
                itemBuilder: (context, index) => controller
                        .payoutModelList.isEmpty
                    ? const NoDataFound(title: 'No record found!')
                    : PayoutTableBody(
                        model: controller.payoutModelList[index],
                        onTap: () async {
                          await controller.getGiftDetail(
                              controller.payoutModelList[index].id.toString(),
                              'Active');
                          await controller.getUserBenes(
                              controller.payoutModelList[index].id.toString());

                          globalContext?.push("${PagePath.payouts}${PagePath.parentDetails.toRoute}?isParent=${true}");
                          // controller.selectedItemIndex = 1;
                          // controller.sideBarList[1].isSelected = true;
                          // controller.sideBarList[5].isSelected = false;
                          // controller.liveGiftingSelectedIndex = 2;
                          controller.update();
                        },
                      ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            if(controller.payoutSearchController.text.isEmpty)
            CommonPagerWidget(
              currentPage: controller.payoutPageNo,
              totalPage: ((controller.elementCount == 0
                          ? 1
                          : controller.elementCount) /
                      10)
                  .ceil(),
              onPageChanged: (page) async {
                controller.payoutPageNo = page;
                await controller.getPayoutTable();
                controller.update();
              },
            ),
          ],
        ),
      );
    });
  }
}

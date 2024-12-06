import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_calendar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/contributions_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/page_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payment_details_dialog_box.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/giftings_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ContributionPage extends StatelessWidget {
  const ContributionPage({super.key});

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
              label: 'Contributions',
              showSearch: true,
              searchController: controller.contributionsSearchController,
              searchCancelOnTap: () async {
                controller.contributionsSearchController.clear();

                await controller.getContributionTable();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.getContributionTable();
                  controller.update();
                });
              },
              exportOnTap: () async {
                await controller.exportContributionsTable();
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
                      controller.contributonModulePageNo = 1;
                      controller.calendarSelectedIndex = index;
                      if (controller.period == CalendarPeriod.customdate) {
                        return;
                      }
                      await controller.contributionsDatefilter(
                          period: controller.period);

                      context.pop();
                    },
                    dateSelectionOnTap: (_) async {
                      controller.period = null;
                      controller.contributonModulePageNo = 1;
                      await controller.contributionsDatefilter(
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
            TotalAmountWidget(
              amount: controller.totalAmount,
            ),
            const VerticalSpacing(20),
            const ContributionTableHeader(
              // value: false,
              titleList: [
                'Payment ID',
                'Gifting Title',
                'Contributor',
                'Benefeciary Name',
                'Payment Gateway',
                'Date & Time',
                'Frequency',
                'Amount',
                'Status',
              ],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.contributionModelList.isEmpty
                    ? 1
                    : controller.contributionModelList.length,
                itemBuilder: (context, index) => controller
                        .contributionModelList.isEmpty
                    ? const NoDataFound(title: 'No record found!')
                    : ContributionsTableBody(
                        model: controller.contributionModelList[index],
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: PaymentDetailsDialogBox(
                                model: controller.contributionModelList[index],
                              ),
                            ),
                          );
                        },
                      ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            if (controller.contributionsSearchController.text.isEmpty)
              CommonPagerWidget(
                currentPage: controller.contributonModulePageNo,
                totalPage: ((controller.elementCount == 0
                            ? 1
                            : controller.elementCount) /
                        controller.pageSize)
                    .ceil(),
                onPageChanged: (page) async {
                  controller.contributonModulePageNo = page;
                  if (controller.period != null) {
                    if (controller.period == CalendarPeriod.customdate) {
                      await controller.contributionsDatefilter(
                        dateTime: DateRangeModel(
                          from: controller
                              .dateRangeController.selectedRange?.startDate,
                          to: controller
                              .dateRangeController.selectedRange?.endDate,
                        ),
                      );
                    } else {
                      await controller.contributionsDatefilter(
                          period: controller.period);
                    }
                  } else {
                    await controller.getContributionTable();
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

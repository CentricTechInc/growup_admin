import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/date_picker_config.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';

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
              // calendarOnTap: (index) {
              //   controller.calendarSelectedIndex = index;
              //   controller.update();
              // },
              calendarOnTap: () {
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
                    // builder: (context) => const CommonCalendarWidget(),
                    pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        CommonCalendarWidget(
                          onTap: (index) {
                            controller.calendarSelectedIndex = index;
                            controller.update();
                          },
                        ));
              },
              // taxBtnOnTap: () {
              //   showDialog(
              //     context: context,
              //     builder: (context) => const Dialog(
              //       backgroundColor: AppColors.greyish,
              //       child: AdjustTaxDialogBox(),
              //     ),
              //   );
              // },
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
                        10)
                    .ceil(),
                onPageChanged: (page) async {
                  controller.parentPageNo = page;
                  await controller.getParentTable();
                  controller.update();
                },
              ),
          ],
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class PageHeader extends StatelessWidget {
  PageHeader({
    super.key,
    required this.label,
    this.showTaxBtn = false,
    this.showSearch = true,
    this.searchOnChanged,
    this.searchController,
    this.taxBtnOnTap,
    this.searchCancelOnTap,
    this.hintText,
    this.exportOnTap,
    this.calendarOnTap,
    this.calendarselectedIndex,
  });

  final String label;
  final bool showTaxBtn;
  final bool showSearch;
  final VoidCallback? taxBtnOnTap;
  final VoidCallback? searchCancelOnTap;
  final VoidCallback? exportOnTap;
  final TextEditingController? searchController;
  dynamic Function(String)? searchOnChanged;
  final String? hintText;
  final VoidCallback? calendarOnTap;
  final int? calendarselectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonText(
          text: label,
          fontSize: 24,
          weight: FontWeight.w700,
        ),
        const Spacer(),
        if (exportOnTap != null)
          InkWell(
            onTap: exportOnTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6)),
              child: const Row(
                children: [
                  Icon(
                    Icons.table_chart,
                    color: AppColors.primary,
                  ),
                  HorizontalSpacing(10),
                  CommonText(
                    text: 'Export Table',
                    fontSize: 16,
                    weight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        const HorizontalSpacing(10),
        Container(
          width: 240,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 0.5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Image.asset(
                Assets.calendarIcon,
                color: AppColors.primary,
                scale: 2,
              ),
              const HorizontalSpacing(5),
              const CommonText(
                text: 'Today',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const Spacer(),
              InkWell(
                  onTap: calendarOnTap,
                  child: const Icon(Icons.keyboard_arrow_down_outlined))
            ],
          ),
        ),
        if (showTaxBtn) const HorizontalSpacing(10),
        if (showTaxBtn)
          InkWell(
            onTap: taxBtnOnTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 0.5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const CommonText(
                text: 'Adjust Fees and Taxes',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
            ),
          ),
        if (showSearch) const HorizontalSpacing(10),
        if (showSearch)
          SizedBox(
            height: 40,
            width: 300,
            child: CommonTextField(
              prefix: Image.asset(
                Assets.searchIcon,
                scale: 2,
              ),
              hintText: hintText ?? 'Search by name, email, phone',
              hintColor: AppColors.secondaryText,
              suffixIcon: Icons.cancel_rounded,
              suffixIconOnTap: searchCancelOnTap,
              isBorderEnabled: true,
              isFilledColor: false,
              borderColor: AppColors.primary,
              enableBorder: AppColors.primary,
              controller: searchController ?? TextEditingController(),
              onChanged: searchOnChanged,
            ),
          ),
      ],
    );
  }
}

class CommonCalendarWidget extends StatelessWidget {
  const CommonCalendarWidget({super.key, required this.onTap});

  final Function(int)? onTap;

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
              width: 600,
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: controller.isCalendarSelectable,
                      child: Calendar(
                        weekDays: const [
                          'Su',
                          'Mo',
                          'Tu',
                          'We',
                          'Thu',
                          'Fr',
                          'Sa',
                        ],
                        datePickerConfig: DatePickerConfig(
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now(),
                        ),
                        hideTodayIcon: true,
                        topRowIconColor: AppColors.secondaryText,
                        showEventListViewIcon: false,
                        selectedColor: AppColors.primaryText,
                        selectedTodayColor: AppColors.primaryText,
                        todayColor: AppColors.primary,
                        eventColor: null,
                        locale: 'en_us',
                        isExpanded: true,
                        datePickerType: DatePickerType.hidden,
                        dayOfWeekStyle: const TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        onRangeSelected: (range) {
                          final Range ran = range;
                          print(ran.to);
                          // print(DateTime.parse(range.toString()));
                        },
                        onDateSelected: (dateTime) {

                          if(controller.calendarSelectedIndex == 4){
                            controller.isCalendarSelectable = true;
                          }else{
                            controller.isCalendarSelectable = false;
                          }
                        },
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        CommonText(
                          text: 'Today',
                          fontSize: 14,
                          weight: FontWeight.w700,
                        ),
                        Spacer(),
                        CommonText(
                          text: 'Clear',
                          fontSize: 14,
                          weight: FontWeight.w700,
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacing(15),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CalendarSelectionCard extends StatelessWidget {
  const CalendarSelectionCard(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greyish : AppColors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            CommonText(
              text: title,
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            const Spacer(),
            if (isSelected) const Icon(Icons.check),
          ],
        ),
      ),
    );
  }
}

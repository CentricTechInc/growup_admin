import 'package:flutter/material.dart';
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
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/adjust_tax_dialog_box.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';

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
              showTaxBtn: true,
              taxBtnOnTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    backgroundColor: AppColors.greyish,
                    child: AdjustTaxDialogBox(),
                  ),
                );
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
                itemCount: controller.userParentModelList.length,
                itemBuilder: (context, index) => ParentTableBody(
                  onTap: () {
                    context.push(
                        PagePath.userParents + PagePath.parentDetails.toRoute);
                  },
                  model: controller.userParentModelList[index],
                ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            CommonPagerWidget(
              currentPage: 1,
              totalPage: 1,
              onPageChanged: (page) {},
            ),
          ],
        );
      }),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader(
      {super.key,
      required this.label,
      this.showTaxBtn = false,
      this.showSearch = true,
      this.taxBtnOnTap});

  final String label;
  final bool showTaxBtn;
  final bool showSearch;
  final VoidCallback? taxBtnOnTap;

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
                  onTap: () {},
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
            width: 260,
            child: CommonTextField(
              prefix: Image.asset(
                Assets.searchIcon,
                scale: 2,
              ),
              isBorderEnabled: true,
              isFilledColor: false,
              borderColor: AppColors.primary,
              enableBorder: AppColors.primary,
              controller: TextEditingController(),
            ),
          ),
      ],
    );
  }
}

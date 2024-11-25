import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payment_details_dialog_box.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';

class ParentTableBody extends StatelessWidget {
  const ParentTableBody({super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final ParentModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  // GetBuilder<UserParentController>(builder: (controller) {
                  // return
                  // SizedBox(
                  //   height: 35,
                  //   width: 35,
                  //   child: Checkbox(
                  //     value: model.isSelected ?? false,
                  //     activeColor: AppColors.primary,
                  //     splashRadius: 10,
                  //     onChanged: (p0) {
                  //       // model.isSelected = p0;
                  //       // controller.update();
                  //     },
                  //     side: const BorderSide(color: AppColors.grey, width: 1),
                  //   ),
                  // ),
                  // ;
                  // }),
                  const HorizontalSpacing(30),
                  CommonText(
                    text: model.id?.toString() ?? '',
                    fontSize: 12,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            const CommonVerticalDivider(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: AppColors.grey,
              thickness: 2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.name ?? '',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            const CommonVerticalDivider(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: AppColors.grey,
              thickness: 2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.email ?? '',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            const CommonVerticalDivider(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: AppColors.grey,
              thickness: 2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.phone ?? '',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(Assets.shareIcon, scale: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






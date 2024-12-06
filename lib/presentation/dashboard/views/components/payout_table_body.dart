import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';

class PayoutTableBody extends StatelessWidget {
  const PayoutTableBody({super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final PayoutModel model;

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
                  // SizedBox(
                  //   height: 35,
                  //   width: 35,
                  //   child: Checkbox(
                  //     value: false,
                  //     activeColor: AppColors.primary,
                  //     splashRadius: 10,
                  //     onChanged: (p0) {},
                  //     side: const BorderSide(color: AppColors.grey, width: 1),
                  //   ),
                  // ),
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.gift?.title ?? '',
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.user?.name ?? '',
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.beneficiary ?? '',
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.createdAt ?? '',
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
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: Row(
                  children: [
                    CommonText(
                      textAlign: TextAlign.right,
                      text: '\$${model.amount}',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 50,
                      child: Image.asset(Assets.shareIcon, scale: 2),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

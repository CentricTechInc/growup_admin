import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payment_details_dialog_box.dart';

class ContributionsTableBody extends StatelessWidget {
  const ContributionsTableBody(
      {super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final ContributionModel model;

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
          children: [
            Expanded(
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
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.contributor ?? '',
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
                child: CommonText(
                  text: model.frequency?.name ?? '',
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
                child: Row(
                  children: [
                    CommonText(
                      text: '\$${model.amount}',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: PaymentDetailsDialogBox(
                              model: model,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(Assets.shareIcon, scale: 2),
                        ),
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/dto/gift_payout_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_payout_table.dart';

class UserParentsPayout extends StatelessWidget {
  const UserParentsPayout({super.key, required this.model});

  final GiftPayoutModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CommonText(
              text: 'Amount Summary',
              fontSize: 20,
              weight: FontWeight.w700,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.secondary.withOpacity(0.2),
              ),
              child: const CommonText(
                text: 'Pending',
                fontSize: 12,
                weight: FontWeight.w400,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        const VerticalSpacing(20),
        Row(
          children: [
            const CommonText(
              text: 'Gross Contribution',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.secondaryText,
            ),
            const Spacer(),
            CommonText(
              text: '\$ ${model.accountSummary?.balance ?? '0'}',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(10),
        Row(
          children: [
            const CommonText(
              text: 'Platform Fees 5%',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.secondaryText,
            ),
            const Spacer(),
            CommonText(
              text: '\$ ${model.accountSummary?.platformFee ?? '0'}',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(10),
        Row(
          children: [
            const CommonText(
              text: 'Tax Deduction 13%',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.secondaryText,
            ),
            const Spacer(),
            CommonText(
              text: '\$ ${model.accountSummary?.taxDeduction ?? '0'}',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(20),
        const Divider(
          color: AppColors.grey,
        ),
        const VerticalSpacing(20),
        Row(
          children: [
            const CommonText(
              text: 'Total amount to transfer',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            const Spacer(),
            CommonText(
              text: '\$ ${model.accountSummary?.contributionTotal ?? ''}',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ],
        ),
        const VerticalSpacing(20),
        const Divider(
          color: AppColors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 11.0),
          child: Row(
            children: [
              const CommonText(
                text: 'Payout',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const Spacer(),
              const CommonText(
                text: 'Payment ID',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const HorizontalSpacing(10),
              SizedBox(
                width: 160,
                child: CommonTextField(
                  controller: TextEditingController(),
                  hintText: '#PID78956',
                ),
              ),
              const HorizontalSpacing(30),
              const CommonText(
                text: 'Amount',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const HorizontalSpacing(10),
              SizedBox(
                width: 160,
                child: CommonTextField(
                  controller: TextEditingController(),
                  hintText: '\$ 1300.00',
                ),
              ),
              const HorizontalSpacing(30),
              CommonTextButton(
                  height: 29,
                  width: 63,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  onPressed: () {},
                  text: 'Pay'),
            ],
          ),
        ),
        const Divider(
          color: AppColors.grey,
        ),
        const VerticalSpacing(20),
        const UserParentLiveGfitingPayoutTableHeader(
            titleList: ['Payment ID', 'Date & Time', 'Amount', 'Status']),
        const VerticalSpacing(10),
        Expanded(
          child: UserParentLiveGfitingPayoutTableBody(
            onTap: () {},
            model: model.payouts ?? [],
          ),
        ),
      ],
    );
  }
}

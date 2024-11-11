import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';

class UserParentsPayout extends StatelessWidget {
  const UserParentsPayout({super.key});

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
            SizedBox(
              width: 150,
              child: CommonDropDownWidget(
                onChanged: (p0) {},
                arryList: const [],
              ),
            ),
          ],
        ),
        const VerticalSpacing(20),
        const Row(
          children: [
            CommonText(
              text: 'Gross Contribution',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.grey,
            ),
            Spacer(),
            CommonText(
              text: '\$ 1512.00',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(10),
        const Row(
          children: [
            CommonText(
              text: 'Platform Fees 5%',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.grey,
            ),
            Spacer(),
            CommonText(
              text: '\$ 50.00',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(10),
        const Row(
          children: [
            CommonText(
              text: 'Tax Deduction 13%',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.grey,
            ),
            Spacer(),
            CommonText(
              text: '\$ 152.00',
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
        const Row(
          children: [
            CommonText(
              text: 'Total amount to transfer',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            Spacer(),
            CommonText(
              text: '\$ 152.00',
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
                text: 'Payment ID',
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
        UserParentLiveGfitingPayoutTableBody(onTap: () {}),
      ],
    );
  }
}

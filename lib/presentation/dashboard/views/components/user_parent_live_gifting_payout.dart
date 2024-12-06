import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/live_gifting_contribution_table_header.dart';

class UserParentsLiveGiftingPayout extends StatelessWidget {
  const UserParentsLiveGiftingPayout({super.key, required this.model});

  final List<ContributionModel> model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LiveGiftingContributionTableHeader(
          titleList: [
            'Payment ID',
            'Frequency',
            'Date & Time',
            'Amount',
            // 'Status',
          ],
        ),
        const VerticalSpacing(10),
        Expanded(
          child: ListView.separated(
            itemCount: model.length,
            itemBuilder: (context, index) => Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.cardGrey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: CommonText(
                        text: model[index].transactionId.toString() ?? '',
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
                        text: model[index].frequency?.name ?? '',
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
                        text: model[index].createdAt ?? '',
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
                        text: '\$ ${model[index].amount}' ?? '',
                        fontSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // const CommonVerticalDivider(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   color: AppColors.grey,
                  //   thickness: 2,
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 30.0),
                  //     child: CommonText(
                  //       text: model[index].createdAt ?? '',
                  //       fontSize: 12,
                  //       weight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const VerticalSpacing(10),
          ),
        ),
      ],
    );
  }
}

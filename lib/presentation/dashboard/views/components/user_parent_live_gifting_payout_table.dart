import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/status_card_widget.dart';

class UserParentLiveGfitingPayoutTableBody extends StatelessWidget {
  const UserParentLiveGfitingPayoutTableBody(
      {super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final List<PayoutModel> model;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => model.isEmpty
            ? const NoDataFound(title: 'No record Found!')
            : InkWell(
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
                        child: Tooltip(
                          message: model[index].transactionId ?? '',
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: CommonText(
                              text: model[index].transactionId ?? '',
                              fontSize: 12,
                              weight: FontWeight.w500,
                              textOverflow: TextOverflow.ellipsis,
                            ),
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
                      const CommonVerticalDivider(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        color: AppColors.grey,
                        thickness: 2,
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child:StatusCardWidget(
                            title: model[index].status?.name ?? '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        separatorBuilder: (context, index) => const VerticalSpacing(10),
        itemCount: model.isEmpty ? 1 : model.length);
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/repositories/activity_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';

class UserParentsActivity extends StatelessWidget {
  const UserParentsActivity({super.key, required this.activityModel});

  final List<ActivityModel> activityModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserParentACtivityTableHeader(
          titleList: [
            'Payment ID',
            'Gifting Title',
            'Benefeciary Name',
            'Frequency',
            'Date & Time',
            'Amount',
            'Status',
          ],
        ),
        const VerticalSpacing(10),
        Expanded(
          child: ListView.separated(
            itemCount: activityModel.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (context) => const Dialog(
                //     child: PaymentDetailsDialogBox(),
                //   ),
                // );
              },
              child: Container(
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
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].transactionId.toString() ??
                              '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CommonVerticalDivider(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].gift?.title ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CommonVerticalDivider(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].beneficiary ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CommonVerticalDivider(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].frequency ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CommonVerticalDivider(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].createdAt ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CommonVerticalDivider(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].amount ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CommonVerticalDivider(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.grey,
                      thickness: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CommonText(
                          text: activityModel[index].gift?.status?.name ?? '',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => VerticalSpacing(10),
          ),
        ),
      ],
    );
  }
}

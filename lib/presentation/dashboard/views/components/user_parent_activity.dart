import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payment_details_dialog_box.dart';

class UserParentsActivity extends StatelessWidget {
  const UserParentsActivity({super.key});

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
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const Dialog(
                child: PaymentDetailsDialogBox(),
              ),
            );
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.cardGrey,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: CommonText(
                      text: '#HS5896',
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
                      text: 'Jason Borne',
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
                      text: 'jasonborne@abc.com',
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
                      text: '+ 0000 0000 000',
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
                      text: '+ 0000 0000 000',
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
                      text: '+ 0000 0000 000',
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
                      text: '+ 0000 0000 000',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

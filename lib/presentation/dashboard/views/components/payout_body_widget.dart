import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class PayoutBodyWidget extends StatelessWidget {
  const PayoutBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return const SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: 'QR ID',
                      textAlign: TextAlign.center,
                      fontSize: 10),
                ),
                CommonVerticalDivider(),
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: 'Registered Name',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: 'Plan',
                      textAlign: TextAlign.center,
                      fontSize: 10),
                ),
                CommonVerticalDivider(),
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: 'Payment Date',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: 'Payment',
                      textAlign: TextAlign.center,
                      fontSize: 9),
                ),
                CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      text: 'Status',
                      fontSize: 10),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.grey,
        ),
      ),
    );
  }
}

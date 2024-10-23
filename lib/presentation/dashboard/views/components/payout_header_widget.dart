import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';

class PayoutHeaderWidget extends StatelessWidget {
  const PayoutHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              text: 'Payment ID',
              textAlign: TextAlign.center,
              fontSize: 10),
        ),
        CommonVerticalDivider(),
        Expanded(
            child: CommonText(
                weight: FontWeight.bold,
                text: 'Gifting Title',
                textAlign: TextAlign.center,
                fontSize: 10)),
        CommonVerticalDivider(),
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              text: 'Parent Name',
              textAlign: TextAlign.center,
              fontSize: 10),
        ),
        CommonVerticalDivider(),
        Expanded(
            child: CommonText(
                weight: FontWeight.bold,
                text: 'Beneficiary Name',
                textAlign: TextAlign.center,
                fontSize: 10)),
        CommonVerticalDivider(),
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              text: 'Date & Time',
              textAlign: TextAlign.center,
              fontSize: 9),
        ),
        CommonVerticalDivider(),
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              textAlign: TextAlign.center,
              text: 'Payout Amount',
              fontSize: 10),
        )
      ],
    );
  }
}

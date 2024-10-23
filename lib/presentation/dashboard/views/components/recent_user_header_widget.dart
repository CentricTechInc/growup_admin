import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';

class RecentUsersHeaderWidget extends StatelessWidget {
  const RecentUsersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              text: 'User ID',
              textAlign: TextAlign.center,
              fontSize: 10),
        ),
        CommonVerticalDivider(),
        Expanded(
            child: CommonText(
                weight: FontWeight.bold,
                text: 'Name',
                textAlign: TextAlign.center,
                fontSize: 10)),
        CommonVerticalDivider(),
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              text: 'Email',
              textAlign: TextAlign.center,
              fontSize: 10),
        ),
        CommonVerticalDivider(),
        Expanded(
            child: CommonText(
                weight: FontWeight.bold,
                text: 'Phone',
                textAlign: TextAlign.center,
                fontSize: 10)),
        CommonVerticalDivider(),
        Expanded(
          child: CommonText(
              weight: FontWeight.bold,
              textAlign: TextAlign.center,
              text: 'Status',
              fontSize: 10),
        )
      ],
    );
  }
}

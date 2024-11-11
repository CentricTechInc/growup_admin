import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/profile_tile.dart';

import '../../../../common/resources/colors.dart';

class BenefeciaryExpansionTile extends StatelessWidget {
  const BenefeciaryExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cardGrey,
      ),
      child: const ExpansionTile(
        title: ProfileTile(),
        shape: Border(),
        tilePadding: EdgeInsets.zero,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: [
          VerticalSpacing(18),
          CommonTile(
            title: 'Age',
            subTitle: '16 years',
          ),
          VerticalSpacing(10),
          CommonTile(title: 'Phone', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Received Contributions', subTitle: '\$ 150.00'),
          VerticalSpacing(20),
          CommonText(
            text: 'Bank Details',
            fontSize: 20,
            weight: FontWeight.w700,
            color: AppColors.primary,
          ),
          VerticalSpacing(10),
          CommonTile(title: 'Bank', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Account Type', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Account Owner Name', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'City ', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'State', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Zip', subTitle: '+1 012-456-789'),
        ],
      ),
    );
  }
}

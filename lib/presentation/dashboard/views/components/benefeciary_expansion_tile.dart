import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/profile_tile.dart';

import '../../../../common/resources/colors.dart';

class BenefeciaryExpansionTile extends StatelessWidget {
  BenefeciaryExpansionTile({super.key, required this.data});
  Data data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cardGrey,
      ),
      child: ExpansionTile(
        title: ProfileTile(
          name: data.name ?? '',
          relation: data.relation ?? '',
        ),
        shape: const Border(),
        tilePadding: EdgeInsets.zero,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: [
          const VerticalSpacing(18),
          CommonTile(
            title: 'Age',
            subTitle: '${data.age ?? 0} years',
          ),
          const VerticalSpacing(10),
          CommonTile(title: 'Phone', subTitle: '${data.phone}'),
          const VerticalSpacing(10),
          CommonTile(
              title: 'Received Contributions',
              subTitle: '${data.contributionCount}'),
          const VerticalSpacing(20),
          const CommonText(
            text: 'Bank Details',
            fontSize: 20,
            weight: FontWeight.w700,
            color: AppColors.primary,
          ),
          const VerticalSpacing(10),
          CommonTile(title: 'Bank', subTitle: '${data.name}'),
          const VerticalSpacing(10),
          CommonTile(title: 'Account Type', subTitle: '${data.accountType}'),
          const VerticalSpacing(10),
          CommonTile(
              title: 'Account Owner Name',
              subTitle: '${data.accountOwnerName}'),
          const VerticalSpacing(10),
          CommonTile(title: 'City ', subTitle: '${data.city}'),
          const VerticalSpacing(10),
          CommonTile(title: 'State', subTitle: '${data.state}'),
          const VerticalSpacing(10),
          CommonTile(title: 'Zip', subTitle: '${data.zip}'),
        ],
      ),
    );
  }
}

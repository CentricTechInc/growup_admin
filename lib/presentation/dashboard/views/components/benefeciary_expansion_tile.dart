import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/profile_tile.dart';

import '../../../../common/resources/colors.dart';

class BenefeciaryExpansionTile extends StatelessWidget {
  BenefeciaryExpansionTile(
      {super.key, required this.data, required this.deleteOnTap});

  Data data;
  final VoidCallback deleteOnTap;

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
          profileImg: data.picture ?? '',
          name: data.name ?? '',
          relation: data.relation ?? '',
          deleteOnTap: deleteOnTap,
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
          Row(
            children: [
              CommonTile(
                  title: 'Phone',
                  subTitle: '${data.phone?.replaceAll('--', '-')}'),
              const Spacer(),
              InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                        text: '${data.phone?.replaceAll('--', '-')}'));
                    CommonSnackBar.message(
                        message: 'Phone number copied',
                        type: SnackBarType.success);
                  },
                  child: const Icon(
                    Icons.copy,
                    color: AppColors.secondaryText,
                  )),
            ],
          ),
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
          CommonTile(title: 'Bank', subTitle: '${data.bank}'),
          const VerticalSpacing(10),
          CommonTile(title: 'Account Type', subTitle: '${data.accountType}'),
          const VerticalSpacing(10),
          CommonTile(
              title: 'Account Owner Name',
              subTitle: '${data.accountOwnerName}'),
          const VerticalSpacing(10),
          Row(
            children: [
              CommonTile(
                  title: 'Account Number', subTitle: '${data.accountNumber}'),
              const Spacer(),
              InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: '${data.accountNumber}'));
                    CommonSnackBar.message(
                        message: 'Account number copied',
                        type: SnackBarType.success);
                  },
                  child: const Icon(
                    Icons.copy,
                    color: AppColors.secondaryText,
                  )),
            ],
          ),
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

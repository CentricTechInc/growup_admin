import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';

class UserContributionPage extends StatelessWidget {
  const UserContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(
            text: 'Contributers',
            fontSize: 24,
            weight: FontWeight.w700,
          ),
          const VerticalSpacing(30),
          const ParentTableHeader(
            // value: false,
            titleList: ['User ID', 'Name', 'Email', 'Phone'],
          ),
          const VerticalSpacing(10),
          ParentTableBody(
            onTap: () {
              context
                  .push(PagePath.userContributor + PagePath.contributorDetails.toRoute);
            },
          ),
        ],
      ),
    );
  }
}

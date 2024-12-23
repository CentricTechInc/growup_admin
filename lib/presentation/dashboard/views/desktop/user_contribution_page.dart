import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';

class UserContributionPage extends StatelessWidget {
  const UserContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GetBuilder<SideBarController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              label: 'Contributors',
            ),
            const VerticalSpacing(30),
            const ParentTableHeader(
              // value: false,
              titleList: ['User ID', 'Name', 'Email', 'Phone'],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.userContributorModelList.length,
                itemBuilder: (context, index) => ParentTableBody(
                  onTap: () {
                    context.push(
                        PagePath.userParents + PagePath.parentDetails.toRoute);
                  },
                  model: controller.userContributorModelList[index],
                ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            CommonPagerWidget(
              currentPage: 1,
              totalPage: 1,
              onPageChanged: (page) {},
            ),
          ],
        );
      }),
    );
  }
}

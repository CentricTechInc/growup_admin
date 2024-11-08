import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';

class GiftingsPage extends StatelessWidget {
  const GiftingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            label: 'Giftings',
          ),
          const VerticalSpacing(30),
          const GiftingTableHeader(
            // value: false,
            titleList: [
              'Gifting ID',
              'Gifting Title',
              'Posted By',
              'Benefeciary Name',
              'Date & Time',
              'Giftings Total',
              'Status'
            ],
          ),
          const VerticalSpacing(10),
          GetBuilder<SideBarController>(builder: (controller) {
            return Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) => GiftingsTableBody(
                  onTap: () {
                    context.go(
                        PagePath.userParents + PagePath.parentDetails.toRoute);
                    controller.selectedItemIndex = 1;
                    controller.sideBarList[1].isSelected = true;
                    controller.sideBarList[3].isSelected = false;
                    controller.update();
                  },
                ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            );
          }),
          const Spacer(),
          CommonPagerWidget(
            currentPage: 1,
            totalPage: 1,
            onPageChanged: (page) {},
          ),
        ],
      ),
    );
  }
}

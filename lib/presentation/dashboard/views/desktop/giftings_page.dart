import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';

class GiftingsPage extends StatelessWidget {
  const GiftingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              hintText: 'Search by Gifting title, Posted by, Benefeciary name',
              searchController: controller.giftingSearchController,
              searchCancelOnTap: () async {
                controller.giftingSearchController.clear();
                //
                await controller.getGiftingTable();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.getGiftingTable();
                  controller.update();
                });
              },
              label: 'Giftings',
            ),
            const VerticalSpacing(30),
            const GiftingTableHeader(
              // value: false,
              titleList: [
                'Gifting ID',
                'Gifting Title',
                'Posted By',

                /// [GetBuilder] to get the user details from the [SideBarController]
                /// and to update the UI when the user details change.
                'Benefeciary Name',
                'Date & Time',
                'Giftings Total',
                'Status'
              ],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.giftingModelList.isEmpty
                    ? 1
                    : controller.giftingModelList.length,
                itemBuilder: (context, index) =>
                    controller.giftingModelList.isEmpty
                        ? const NoDataFound(title: 'No record found!')
                        : GiftingsTableBody(
                            model: controller.giftingModelList[index],
                            onTap: () async {
                              await controller.getGiftDetail(
                                  controller.giftingModelList[index].userId
                                      .toString(),
                                  'Active');
                              await controller.getUserBenes(
                                controller.giftingModelList[index].userId
                                    .toString(),
                              );
                              globalContext?.push(PagePath.giftings +
                                  PagePath.parentDetails.toRoute);

                              controller.update();
                            },
                          ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            if(controller.giftingSearchController.text.isEmpty)
            CommonPagerWidget(
              currentPage: controller.giftingsPageNo,
              totalPage: ((controller.elementCount == 0
                          ? 1
                          : controller.elementCount) /
                      10)
                  .ceil(),
              onPageChanged: (page) async {
                controller.giftingsPageNo = page;
                await controller.getGiftingTable();
                controller.update();
              },
            ),
          ],
        ),
      );
    });
  }
}

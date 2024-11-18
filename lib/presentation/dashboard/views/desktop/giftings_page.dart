import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
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
          PageHeader(
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
                itemCount: controller.giftingModelList.length,
                itemBuilder: (context, index) => GiftingsTableBody(
                  model: controller.giftingModelList[index],
                  onTap: () async {
                    try {
                      GiftDetailDto giftDetailDto =
                          await controller.getGiftDetail(controller
                              .giftingModelList[index].userId
                              .toString());
                      UserBeneficiaryDto giftBenesDto =
                          await controller.getUserBenes(
                              controller.giftingModelList[index].userId
                                  .toString(),
                              '1');
                      globalContext?.push(
                          PagePath.giftings + PagePath.parentDetails.toRoute,
                          extra: {
                            'giftDetailDto': giftDetailDto,
                            'giftBenesDto': giftBenesDto
                          });
                    } catch (e) {
                      print(e);
                    }
                    controller.update();
                  },
                ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            );
          }),
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

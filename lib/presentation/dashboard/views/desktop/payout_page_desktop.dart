import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payout_page_body_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payout_page_header_widget.dart';

class PayoutPageDesktop extends StatelessWidget {
  const PayoutPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Row(
            children: [
              CommonText(
                text: 'Payout',
                fontSize: 24,
                weight: FontWeight.w700,
              ),
            ],
          ),
          const VerticalSpacing(20),
          const PayoutPageHeaderWidget(),
          const VerticalSpacing(10),
          const Expanded(child: PayoutPageBodyWidget()),
          const VerticalSpacing(20),
          GetBuilder<SideBarController>(builder: (controller) {
            return CommonPagerWidget(
                currentPage: controller.payoutPageNo,
                totalPage:
                    (controller.elementCount / controller.pageSize).ceil(),
                onPageChanged: (int value) {});
          })
        ],
      ),
    );
  }
}

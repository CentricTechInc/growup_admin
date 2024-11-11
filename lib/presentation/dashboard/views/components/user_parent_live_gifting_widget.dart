import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_payout.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parents_payout.dart';
class UserParentLiveGiftingWidget extends StatelessWidget {

  const UserParentLiveGiftingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Container(
        // height: context.height / 1.6,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.cardGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height / 2,
              child: PageView(
                controller: controller.liveGiftingPageController,
                children: const [
                  ParentLiveGiftingsWidget(),
                  UserParentsLiveGiftingPayout(),
                  UserParentsPayout(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

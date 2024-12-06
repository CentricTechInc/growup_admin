import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_back_button.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_payout.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parents_payout.dart';

class GiftDetailPage extends StatelessWidget {
  const GiftDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: GetBuilder<SideBarController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonBackButton(),
              const VerticalSpacing(20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        flex: 20,
                        child: TabBarWidget(
                          selectedIndex: controller.liveGiftingSelectedIndex,
                          controller: controller.liveGiftingPageController,
                          selectedColor: AppColors.cardGrey,
                          title: const [
                            'Gifting Details',
                            'Contributions',
                            'Payout'
                          ],
                          onTap: (index) async {
                            controller.liveGiftingSelectedIndex = index;

                            final int giftId = controller.giftDetail.id ?? 0;
                            switch (index) {
                              case 0:
                                // await controller.getGiftDetail(
                                //     userId.toString(),
                                //     isLive ? 'Active' : 'Expired');
                                break;
                              case 1:
                                await controller.getGiftContributions(giftId);
                                break;
                              case 2:
                                await controller
                                    .getGiftPayoutDetail(giftId.toString());
                                controller.payoutAmountController.clear();
                                break;
                            }

                            controller.update();
                          },
                        ),
                      ),
                    ]),
                    const VerticalSpacing(30),
                    SizedBox(
                      height: context.height / 1.8,
                      child: PageView(
                        controller: controller.liveGiftingPageController,
                        children: [
                          ParentLiveGiftingsWidget(
                            giftingModel: controller.giftDetail,
                          ),
                          UserParentsLiveGiftingPayout(
                            model: controller.giftContributionList,
                          ),
                          UserParentsPayout(
                            controller: controller.payoutAmountController,
                            model: controller.giftPayoutData,
                            payOnTap: () async {
                              await controller.postGiftPayout(
                                  controller.payoutAmountController.text,
                                  controller.giftDetail.beneficiaryId ?? -1,
                                  controller.giftDetail.id ?? -1);

                              await controller.getGiftPayoutDetail(
                                  controller.giftDetail.id?.toString() ?? '');
                              controller.payoutAmountController.clear();
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

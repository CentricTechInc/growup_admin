import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/gifting_details_expansion_collapsed.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_payout.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parents_payout.dart';

class UserParentLiveGiftingWidget extends StatelessWidget {
  UserParentLiveGiftingWidget(
      {super.key, required this.giftingModel, required this.isLive});

  final List<GiftingModel> giftingModel;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return ListView.separated(
        itemCount: giftingModel.isEmpty ? 1 : giftingModel.length,
        itemBuilder: (context, listIndex) {
          return giftingModel.isEmpty
              ? const NoDataFound(title: 'No gifts found!')
              : Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.cardGrey,
                  ),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.zero,
                    tilePadding: EdgeInsets.zero,
                    shape: const Border(),
                    onExpansionChanged: (collapse) {
                      giftingModel[listIndex].isCollapsed = !collapse;
                      if (collapse == false) {
                        controller.liveGiftingSelectedIndex = 0;
                      }
                      controller.update();
                    },
                    title: Visibility(
                      visible: giftingModel[listIndex].isCollapsed ?? false,
                      replacement: Row(
                        children: [
                          TabBarWidget(
                            selectedIndex:
                                controller.liveGiftingSelectedIndex,
                            controller: controller.liveGiftingPageController,
                            selectedColor: AppColors.white,
                            title: const [
                              'Gifting Details',
                              'Contributions',
                              'Payout'
                            ],
                            onTap: (index) async {
                              controller.liveGiftingSelectedIndex = index;

                              final String userId = giftingModel[listIndex]
                                      .userId
                                      ?.toString() ??
                                  '0';
                              final int giftId =
                                  giftingModel[listIndex].id ?? 0;
                              switch (index) {
                                case 0:
                                  // await controller.getGiftDetail(
                                  //     userId.toString(),
                                  //     isLive ? 'Active' : 'Expired');
                                  break;
                                case 1:
                                  await controller
                                      .getGiftContributions(giftId);
                                  break;
                                case 2:
                                  await controller
                                      .getGiftPayoutDetail(giftId.toString());
                                  controller.payoutAmountController.clear();
                                  break;
                              }
                              print(userId);

                              controller.update();
                            },
                          ),
                          const Spacer(),
                          CommonIconButton(
                            icon: Assets.deleteIcon,
                            onTap: () async {
                              await controller.deleteGift(
                                  giftingModel[listIndex].id ?? 0);
                              await controller.getGiftDetail(
                                  controller.giftingDetailData.data?.user?.id
                                          .toString() ??
                                      '',
                                  isLive ? 'Active' : 'Expired');
                              controller.update();
                            },
                            color: AppColors.red,
                          ),
                        ],
                      ),
                      child: GiftingDeatilsExpansionCollapsed(
                        giftingModel: giftingModel[listIndex],
                        onDelete: () async {
                          await controller
                              .deleteGift(giftingModel[listIndex].id ?? 0);
                          await controller.getParentDetail(
                              controller.parentDetailData.id ?? 0);
                          await controller.getGiftDetail(
                              controller.parentDetailData.id.toString() ?? '',
                              isLive ? 'Active' : 'Expired');
                          controller.update();
                        },
                      ),
                    ),
                    children: [
                      SizedBox(
                        height: context.height / 1.8,
                        child: PageView(
                          controller:
                              controller.liveGiftingPageController,
                          children: [
                            ParentLiveGiftingsWidget(
                              giftingModel: giftingModel[listIndex],
                            ),
                            UserParentsLiveGiftingPayout(
                              model: controller.giftContributionList,
                            ),
                            UserParentsPayout(
                              controller:
                                  controller.payoutAmountController,
                              model: controller.giftPayoutData,
                              payOnTap: () async {
                                await controller.postGiftPayout(
                                    controller
                                        .payoutAmountController.text,
                                    giftingModel[listIndex]
                                            .beneficiaryId ??
                                        -1,
                                    giftingModel[listIndex].id ?? -1);

                                await controller.getGiftPayoutDetail(
                                    giftingModel[listIndex]
                                            .id
                                            ?.toString() ??
                                        '');
                                controller.payoutAmountController
                                    .clear();
                                controller.update();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
        separatorBuilder: (context, index) => const VerticalSpacing(10),
      );
    });

    // return GetBuilder<SideBarController>(builder: (controller) {
    //   return Container(
    //     // height: context.height / 1.6,
    //     padding: const EdgeInsets.symmetric(horizontal: 30),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       color: AppColors.cardGrey,
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           height: context.height / 2,
    //           child: PageView(
    //             controller: controller.liveGiftingPageController,
    //             children: const [
    //               ParentLiveGiftingsWidget(),
    //               UserParentsLiveGiftingPayout(),
    //               UserParentsPayout(),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/gifting_details_expansion_collapsed.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_payout.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parents_payout.dart';

class UserParentLiveGiftingWidget extends StatelessWidget {
  UserParentLiveGiftingWidget({super.key, required this.giftingModel});

  final List<GiftingModel> giftingModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      bool isCollapsed = true;
      return ListView.separated(
        itemCount: giftingModel.isEmpty ? 1 : giftingModel.length,
        itemBuilder: (context, listIndex) => giftingModel.isEmpty
            ? const NoDataFound(title: 'No gifts found!')
            : Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.cardGrey,
                ),
                child: ExpansionTile(
                  shape: const Border(),
                  onExpansionChanged: (collapse) {
                    isCollapsed = !collapse;
                    controller.update();
                    print('isCollapsed : ' + isCollapsed.toString());
                  },
                  title: isCollapsed
                      ? GiftingDeatilsExpansionCollapsed(
                          giftingModel: giftingModel[listIndex],
                          onDelete: () async {
                            await controller
                                .deleteGift(giftingModel[listIndex].id ?? 0);
                          },
                        )
                      : Row(
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
                                switch (index) {
                                  case 0:
                                    await controller.getGiftDetail(
                                        userId, 'Active');
                                  case 1:
                                    await controller
                                        .getGiftContributions(userId);
                                  case 2:
                                    await controller
                                        .getGiftPayoutDetail(userId);
                                }
                                print(userId);
                                // controller.liveGiftingPageController.animateToPage(
                                //     index,
                                //     duration: const Duration(seconds: 1),
                                //     curve: Curves.ease);
                                // controller.liveGiftingSelectedIndex = controller
                                //         .liveGiftingPageController.page
                                //         ?.toInt() ??
                                //     0;
                                controller.update();
                              },
                            ),
                            const Spacer(),
                            CommonIconButton(
                              icon: Assets.deleteIcon,
                              onTap: () async {
                                print('here delete');
                                await controller.deleteGift(
                                    giftingModel[listIndex].id ?? 0);
                                await controller.getGiftDetail(
                                    controller.giftingDetailData.data?.user?.id
                                            .toString() ??
                                        '',
                                    'Active');
                                controller.update();
                              },
                              color: AppColors.red,
                            ),
                          ],
                        ),
                  children: [
                    SizedBox(
                      height: context.height / 1.8,
                      child: PageView(
                        controller: controller.liveGiftingPageController,
                        children: [
                          ParentLiveGiftingsWidget(
                            giftingModel: controller.giftingDetailData.data
                                    ?.giftingModel?[listIndex] ??
                                GiftingModel(),
                          ),
                          UserParentsLiveGiftingPayout(
                            model: controller.giftContributionList,
                          ),
                          UserParentsPayout(
                            model: controller.giftPayoutData,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.noGiftIconIcon,
          scale: 2,
        ),
        const VerticalSpacing(10),
        CommonText(
          text: title,
          fontSize: 16,
          weight: FontWeight.w600,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}

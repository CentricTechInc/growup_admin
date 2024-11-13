import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/common_back_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/benefeciary_expansion_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/gifting_details_expansion_collapsed.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_details_card_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_activity.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';

class UserParentDetails extends StatelessWidget {
  UserParentDetails(
      {super.key, required this.giftDetailDto, required this.giftBeneDto});
  GiftDetailDto giftDetailDto = GiftDetailDto();
  UserBeneficiaryDto giftBeneDto = UserBeneficiaryDto();
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBackButton(
              onTap: () {
                context.pop();
              },
            ),
            const VerticalSpacing(30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardGrey,
                          ),
                          child: Row(
                            children: [
                              const CommonText(
                                text: 'User ID',
                                fontSize: 16,
                                weight: FontWeight.w700,
                              ),
                              const HorizontalSpacing(20),
                              const CommonText(
                                text: '#D10889',
                                fontSize: 16,
                                color: AppColors.primary,
                                weight: FontWeight.w700,
                              ),
                              const Spacer(),
                              const CommonText(
                                text: 'Status',
                                fontSize: 16,
                                weight: FontWeight.w700,
                              ),
                              const HorizontalSpacing(20),
                              SizedBox(
                                width: 160,
                                child: CommonDropDownWidget(
                                  onChanged: (p0) {},
                                  arryList: const [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        ParentDetailsCardWidget(
                          data: giftDetailDto,
                        ),
                        const VerticalSpacing(20),
                        GetBuilder<SideBarController>(builder: (controller) {
                          return TabBarWidget(
                            selectedIndex: controller.userParentSelectedIndex,
                            controller: controller.userParentPageController,
                            title: const [
                              'Live Giftings',
                              'Previous Giftings',
                              'Activity'
                            ],
                            onTap: (index) {
                              print('INSIDE USER PARENT PAGE');
                              print(controller.userParentSelectedIndex);
                              controller.userParentPageController.animateToPage(
                                  index,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease);

                              controller.userParentSelectedIndex = index;
                              controller.update();
                            },
                          );
                        }),
                        const VerticalSpacing(20),
                        GetBuilder<SideBarController>(builder: (controller) {
                          return Container(
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
                              },
                              title: isCollapsed
                                  ? const GiftingDeatilsExpansionCollapsed()
                                  : Row(
                                      children: [
                                        TabBarWidget(
                                          selectedIndex: controller
                                              .liveGiftingSelectedIndex,
                                          controller: controller
                                              .liveGiftingPageController,
                                          selectedColor: AppColors.white,
                                          title: const [
                                            'Gifting Details',
                                            'Contributions',
                                            'Payout'
                                          ],
                                          onTap: (index) {
                                            controller.liveGiftingPageController
                                                .animateToPage(index,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.ease);
                                            controller
                                                    .liveGiftingSelectedIndex =
                                                controller
                                                        .liveGiftingPageController
                                                        .page
                                                        ?.toInt() ??
                                                    0;
                                            controller
                                                    .liveGiftingSelectedIndex =
                                                index;
                                            controller.update();
                                          },
                                        ),
                                        const Spacer(),
                                        CommonIconButton(
                                          icon: Assets.deleteIcon,
                                          onTap: () {},
                                          color: AppColors.red,
                                        ),
                                      ],
                                    ),
                              children: [
                                SizedBox(
                                  height: context.height / 1.5,
                                  child: PageView(
                                    controller:
                                        controller.userParentPageController,
                                    children: const [
                                      UserParentLiveGiftingWidget(),
                                      UserParentLiveGiftingWidget(),
                                      UserParentsActivity(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        const VerticalSpacing(10),
                        // GetBuilder<SideBarController>(
                        //   builder: (controller) {
                        //     return
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                const HorizontalSpacing(30),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonText(
                          text: 'Beneficiaries',
                          fontSize: 20,
                          weight: FontWeight.w600,
                        ),
                        const VerticalSpacing(20),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BenefeciaryExpansionTile(
                              data: giftBeneDto.data![index],
                            );
                          },
                          itemCount: giftBeneDto.data?.length ?? 0,
                          separatorBuilder: (context, index) {
                            return const VerticalSpacing(20);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

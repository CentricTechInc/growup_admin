import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_back_button.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/benefeciary_expansion_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_details_card_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_activity.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';

class UserParentDetails extends StatelessWidget {
  const UserParentDetails({
    super.key,
    required this.isParent,
  });

  final bool isParent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonBackButton(),
            const VerticalSpacing(30),
            GetBuilder<SideBarController>(builder: (controller) {
              return Row(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                CommonText(
                                  text: controller.parentDetailData.id
                                          .toString() ??
                                      '',
                                  fontSize: 16,
                                  color: AppColors.primary,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                          const VerticalSpacing(20),
                          DetailsCardWidget(
                            title: isParent
                                ? 'Parent Details'
                                : 'Contributor Details',
                            parentModel: controller.parentDetailData,
                            giftModel: controller.giftingDetailData,
                          ),
                          const VerticalSpacing(20),
                          isParent
                              ? TabBarWidget(
                                  selectedIndex:
                                      controller.userParentSelectedIndex,
                                  controller:
                                      controller.userParentPageController,
                                  title: const [
                                    'Live Giftings',
                                    'Previous Giftings',
                                    'Activity'
                                  ],
                                  onTap: (index) async {
                                    controller.userParentSelectedIndex = index;
                                    final int parentId =
                                        controller.parentDetailData.id ?? -1;
                                    if (isParent) {
                                      switch (index) {
                                        case 0:
                                          await controller.getGiftDetail(
                                              parentId.toString() ?? '',
                                              'Active');
                                          break;
                                        case 1:
                                          await controller.getGiftDetail(
                                              parentId.toString() ?? '',
                                              'Expired');
                                          break;
                                        case 2:
                                          await controller.getActivity(
                                              parentId.toString() ?? '');
                                          break;
                                      }
                                    } else {
                                      if (index == 0 || index == 1) {
                                        controller.userParentSelectedIndex = 2;
                                        return;
                                      }
                                      await controller.getActivity(
                                          parentId.toString() ?? '');
                                    }
                                    controller.update();
                                  },
                                )
                              : const CommonText(
                                  text: 'Activity',
                                  fontSize: 20,
                                  weight: FontWeight.w700,
                                ),
                          const VerticalSpacing(20),
                          SizedBox(
                            height: context.height / 2.5,
                            child: PageView(
                              controller: controller.userParentPageController,
                              children: isParent
                                  ? [
                                      controller.isLoading
                                          ? const SizedBox()
                                          : UserParentLiveGiftingWidget(
                                              isLive: true,
                                              giftingModel:
                                                  controller.giftDetailList),
                                      controller.isLoading
                                          ? const SizedBox()
                                          : UserParentLiveGiftingWidget(
                                              isLive: false,
                                              giftingModel:
                                                  controller.giftDetailList,
                                            ),
                                      controller.isLoading
                                          ? const SizedBox()
                                          : UserParentsActivity(
                                              activityModel:
                                                  controller.activityModel,
                                            ),
                                    ]
                                  : [
                                      controller.isLoading
                                          ? const SizedBox()
                                          : UserParentsActivity(
                                              activityModel:
                                                  controller.activityModel,
                                            ),
                                    ],
                            ),
                          ),
                          const VerticalSpacing(10),
                        ],
                      ),
                    ),
                  ),
                  const HorizontalSpacing(30),
                  if (isParent)
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
                            GetBuilder<SideBarController>(
                                builder: (controller) {
                              return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return controller
                                              .benefeciaryData.data?.length ==
                                          0
                                      ? const NoDataFound(
                                          title: 'No beneficiaries yet!')
                                      : BenefeciaryExpansionTile(
                                          data: controller
                                              .benefeciaryData.data![index],
                                          deleteOnTap: () async {
                                            await controller.deleteBenefeciary(
                                                controller.benefeciaryData
                                                        .data![index].id ??
                                                    0);

                                            await controller.getUserBenes(
                                                controller.parentDetailData.id
                                                    .toString());
                                            controller.update();
                                          });
                                },
                                itemCount:
                                    controller.benefeciaryData.data?.length == 0
                                        ? 1
                                        : controller
                                                .benefeciaryData.data?.length ??
                                            0,
                                separatorBuilder: (context, index) {
                                  return const VerticalSpacing(20);
                                },
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

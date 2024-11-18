import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/common_back_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/benefeciary_expansion_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_details_card_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_activity.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';

class UserParentDetails extends StatelessWidget {
  const UserParentDetails({
    super.key,
  });

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
                                  text: controller
                                          .giftingDetailData.data?.user?.id
                                          .toString() ??
                                      '',
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
                                    fillColor:
                                        AppColors.primary.withOpacity(0.2),
                                    selectedItem: 'Active',
                                    selectedItemColor: AppColors.primary,
                                    borderColor: AppColors.transparent,
                                    iconColor: AppColors.primary,
                                    onChanged: (p0) {},
                                    arryList: const ['Active', 'Expired'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const VerticalSpacing(20),
                          ParentDetailsCardWidget(
                            giftModel: controller.giftingDetailData,
                          ),
                          const VerticalSpacing(20),
                          TabBarWidget(
                            selectedIndex: controller.userParentSelectedIndex,
                            controller: controller.userParentPageController,
                            title: const [
                              'Live Giftings',
                              'Previous Giftings',
                              'Activity'
                            ],
                            onTap: (index) async {
                              controller.userParentSelectedIndex = index;
                              print(index);
                              switch (index) {
                                case 0:
                                  await controller.getGiftDetail(
                                      controller
                                              .giftingDetailData.data?.user?.id
                                              .toString() ??
                                          '',
                                      'Active');
                                  break;
                                case 1:
                                  await controller.getGiftDetail(
                                      controller
                                              .giftingDetailData.data?.user?.id
                                              .toString() ??
                                          '',
                                      'Expired');
                                  break;
                                case 2:
                                  await controller.getActivity(controller
                                          .giftingDetailData.data?.user?.id
                                          .toString() ??
                                      '');
                                  break;
                              }
                              controller.update();
                              print(index);
                              // if(_scrollController.hasClients){
                              //   controller.userParentPageController.animateToPage(
                              //       index,
                              //       duration: const Duration(seconds: 1),
                              //       curve: Curves.ease);
                              // }
                            },
                          ),
                          const VerticalSpacing(20),
                          SizedBox(
                            height: context.height / 1.8,
                            child: PageView(
                              controller: controller.userParentPageController,
                              children: [
                                controller.isLoading
                                    ? const CupertinoActivityIndicator()
                                    : UserParentLiveGiftingWidget(
                                        giftingModel: controller
                                                .giftingDetailData
                                                .data
                                                ?.giftingModel ??
                                            [],
                                      ),
                                controller.isLoading
                                    ? const CupertinoActivityIndicator()
                                    : UserParentLiveGiftingWidget(
                                        giftingModel: controller
                                                .giftingDetailData
                                                .data
                                                ?.giftingModel ??
                                            [],
                                      ),
                                controller.isLoading
                                    ? const CupertinoActivityIndicator()
                                    : UserParentsActivity(
                                        activityModel: controller.activityModel,
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
                          GetBuilder<SideBarController>(builder: (controller) {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return controller.benefeciaryData.data == null
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
                                          print(controller
                                              .giftingDetailData.data?.user?.id
                                              .toString());
                                          await controller.getUserBenes(
                                              controller.giftingDetailData.data
                                                      ?.user?.id
                                                      .toString() ??
                                                  '0');
                                          controller.update();
                                        });
                              },
                              itemCount: controller.benefeciaryData?.data ==
                                      null
                                  ? 1
                                  : controller.benefeciaryData.data?.length ??
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

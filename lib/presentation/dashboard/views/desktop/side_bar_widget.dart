import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Container(
        width: context.width * 0.15,
        padding: EdgeInsets.symmetric(vertical: context.height * 0.1),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              Assets.logo,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColors.greyish,
            ),
            const SizedBox(
              height: 50,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    // if (LocalStorageService.instance.user == null) {
                    //   context.go(PagePath.login);
                    //   return;
                    // }
                    for (var element in controller.sideBarList) {
                      element.isSelected = false;
                    }
                    controller.update();

                    controller.selectedItemIndex = index;
                    controller.sideBarList[index].isSelected = true;
                    switch (index) {
                      case 0:
                        context.go(PagePath.dashboard);
                        await Get.find<DashboardController>().init();
                        break;
                      case 1:
                        context.go(PagePath.userParents);
                        controller.parentTableSearchController.clear();
                        await controller.getParentTable();
                        controller.liveGiftingSelectedIndex = 0;
                        controller.userParentSelectedIndex = 0;
                        controller.update();
                        // controller.resetPaging();
                        break;
                      case 2:
                        context.go(PagePath.userContributor);
                        controller.contributorTableSearchController.clear();
                        await controller.getContributorsTable();
                        // controller.resetPaging();
                        controller.liveGiftingSelectedIndex = 0;
                        controller.userParentSelectedIndex = 0;
                        controller.update();
                        // controller.userParentPageController.dispose();

                        break;
                      case 3:
                        context.go(PagePath.giftings);
                        controller.giftingSearchController.clear();

                        await controller.getGiftingTable();
                        break;
                      case 4:
                        context.go(PagePath.contrbutions);
                        controller.contributionsSearchController.clear();
                        await controller.getContributionTable();
                        break;
                      case 5:
                        context.go(PagePath.payouts);
                        controller.payoutSearchController.clear();
                        await controller.getPayoutTable();
                        break;
                      case 6:
                        context.go(PagePath.analytics);
                        break;
                      default:
                        context.go(PagePath.dashboard);
                    }
                    controller.update();
                    if (!Responsive.isDesktop(context) &&
                        controller.drawerKey.currentState!.isDrawerOpen) {
                      controller.drawerKey.currentState!.closeDrawer();
                    }
                  },
                  child: SizedBox(
                    // height: 30,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                            height: 25,
                            width: 25,
                            color: (controller.sideBarList[index].isSelected ??
                                    false)
                                ? AppColors.primary
                                : AppColors.grey,
                            controller.sideBarList[index].imageUrl ?? ''),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CommonText(
                              color: (controller
                                          .sideBarList[index].isSelected ??
                                      false)
                                  ? AppColors.black
                                  : AppColors.secondaryText.withOpacity(0.8),
                              fontSize: 15,
                              weight:
                                  (controller.sideBarList[index].isSelected ??
                                          false)
                                      ? FontWeight.w800
                                      : FontWeight.w300,
                              text:
                                  controller.sideBarList[index].itemName ?? ''),
                        ),
                        if (controller.sideBarList[index].isSelected ?? false)
                          Container(
                            width: 5,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.sideBarList.length,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            //   child: InkWell(
            //     onTap: () {
            //       // LocalStorageService.instance.logoutUser();
            //     },
            //     child: const Row(
            //       children: [
            //         Icon(
            //           Icons.logout,
            //           color: AppColors.red,
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         CommonText(
            //           color: AppColors.grey,
            //           text: 'Log Out',
            //           fontSize: 15,
            //           weight: FontWeight.w700,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ]),
        ),
      );
    });
  }
}

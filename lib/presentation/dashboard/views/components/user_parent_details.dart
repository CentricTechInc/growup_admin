import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/common_back_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/live_gifting_contribution_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/profile_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';

class UserParentDetails extends StatelessWidget {
  const UserParentDetails({super.key});

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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardGrey,
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonText(
                                text: 'Parent Details',
                                fontSize: 20,
                                weight: FontWeight.w700,
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Name',
                                      fontSize: 16,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Name',
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Total Gifting',
                                      fontSize: 16,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Total Gifting',
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                        GetBuilder<SideBarController>(
                          builder: (controller) {
                            return SizedBox(
                              height: context.height / 1.5,
                              child: PageView(
                                controller: controller.userParentPageController,
                                children: const [
                                  UserParentLiveGiftingWidget(),
                                  UserParentLiveGiftingWidget(),
                                  UserParentsLiveGiftingPayout(),
                                  ],
                              ),
                            );
                          },
                        ),
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Beneficiaries',
                          fontSize: 20,
                          weight: FontWeight.w600,
                        ),
                        VerticalSpacing(20),
                        BenefeciaryExpansionTile(),
                        VerticalSpacing(20),
                        BenefeciaryExpansionTile(),
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
class UserParentLiveGiftingWidget extends StatelessWidget {
  const UserParentLiveGiftingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(
      builder: (controller) {
        return Container(
          height: context.height / 1.6,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cardGrey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBarWidget(
                selectedIndex:
                controller.liveGiftingSelectedIndex,
                controller:
                controller.liveGiftingPageController,
                selectedColor: AppColors.white,
                title: const [
                  'Gifting Details',
                  'Contributions',
                  'Payout'
                ],
                onTap: (index) {
                  controller.liveGiftingPageController
                      .animateToPage(index,
                      duration:
                      const Duration(seconds: 1),
                      curve: Curves.ease);
                  controller.liveGiftingSelectedIndex =
                      controller.liveGiftingPageController
                          .page
                          ?.toInt() ??
                          0;
                  controller.liveGiftingSelectedIndex =
                      index;
                  controller.update();
                },
              ),
              const VerticalSpacing(20),
              SizedBox(
                height: context.height / 2,
                child: PageView(
                  controller:
                  controller.liveGiftingPageController,
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
      }
    );
  }
}

class BenefeciaryExpansionTile extends StatelessWidget {
  const BenefeciaryExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cardGrey,
      ),
      child: const ExpansionTile(
        title: ProfileTile(),
        shape: Border(),
        tilePadding: EdgeInsets.zero,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: [
          VerticalSpacing(18),
          CommonTile(
            title: 'Age',
            subTitle: '16 years',
          ),
          VerticalSpacing(10),
          CommonTile(title: 'Phone', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Received Contributions', subTitle: '\$ 150.00'),
          VerticalSpacing(20),
          CommonText(
            text: 'Bank Details',
            fontSize: 20,
            weight: FontWeight.w700,
            color: AppColors.primary,
          ),
          VerticalSpacing(10),
          CommonTile(title: 'Bank', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Account Type', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Account Owner Name', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'City ', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'State', subTitle: '+1 012-456-789'),
          VerticalSpacing(10),
          CommonTile(title: 'Zip', subTitle: '+1 012-456-789'),
        ],
      ),
    );
  }
}

class UserParentsLiveGiftingPayout extends StatelessWidget {
  const UserParentsLiveGiftingPayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LiveGiftingContributionTableHeader(
          titleList: [
            'Payment ID',
            'Frequency',
            'Date & Time',
            'Amount',
            'Status',
          ],
        ),
        const VerticalSpacing(10),
        InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: Checkbox(
                          value: false,
                          activeColor: AppColors.primary,
                          splashRadius: 10,
                          onChanged: (p0) {},
                          side:
                              const BorderSide(color: AppColors.grey, width: 1),
                        ),
                      ),
                      const HorizontalSpacing(30),
                      const CommonText(
                        text: '#HS5896',
                        fontSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const CommonVerticalDivider(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: AppColors.grey,
                  thickness: 2,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: CommonText(
                      text: 'Jason Borne',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                const CommonVerticalDivider(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: AppColors.grey,
                  thickness: 2,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: CommonText(
                      text: 'jasonborne@abc.com',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                const CommonVerticalDivider(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: AppColors.grey,
                  thickness: 2,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: CommonText(
                      text: '+ 0000 0000 000',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                const CommonVerticalDivider(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: AppColors.grey,
                  thickness: 2,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: CommonText(
                      text: '+ 0000 0000 000',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class UserParentsPayout extends StatelessWidget {
  const UserParentsPayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CommonText(
              text: 'Amount Summary',
              fontSize: 20,
              weight: FontWeight.w700,
            ),
            const Spacer(),
            SizedBox(
              width: 150,
              child: CommonDropDownWidget(
                onChanged: (p0) {},
                arryList: const [],
              ),
            ),
          ],
        ),
        const VerticalSpacing(20),
        const Row(
          children: [
            CommonText(
              text: 'Gross Contribution',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.grey,
            ),
            Spacer(),
            CommonText(
              text: '\$ 1512.00',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(10),
        const Row(
          children: [
            CommonText(
              text: 'Platform Fees 5%',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.grey,
            ),
            Spacer(),
            CommonText(
              text: '\$ 50.00',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(10),
        const Row(
          children: [
            CommonText(
              text: 'Tax Deduction 13%',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.grey,
            ),
            Spacer(),
            CommonText(
              text: '\$ 152.00',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ],
        ),
        const VerticalSpacing(20),
        const Divider(
          color: AppColors.grey,
        ),
        const VerticalSpacing(20),
        const Row(
          children: [
            CommonText(
              text: 'Total amount to transfer',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            Spacer(),
            CommonText(
              text: '\$ 152.00',
              fontSize: 16,
              weight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ],
        ),
        const VerticalSpacing(20),
        const Divider(
          color: AppColors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 11.0),
          child: Row(
            children: [
              const CommonText(
                text: 'Payout',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const Spacer(),
              const CommonText(
                text: 'Payment ID',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const HorizontalSpacing(10),
              SizedBox(
                width: 160,
                child: CommonTextField(
                  controller: TextEditingController(),
                  hintText: '#PID78956',
                ),
              ),
              const HorizontalSpacing(30),
              const CommonText(
                text: 'Payment ID',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
              const HorizontalSpacing(10),
              SizedBox(
                width: 160,
                child: CommonTextField(
                  controller: TextEditingController(),
                  hintText: '\$ 1300.00',
                ),
              ),
              const HorizontalSpacing(30),
              CommonTextButton(
                  height: 29,
                  width: 63,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  onPressed: () {},
                  text: 'Pay'),
            ],
          ),
        ),
        const Divider(
          color: AppColors.grey,
        ),
        const VerticalSpacing(20),
        const UserParentLiveGfitingPayoutTableHeader(
            titleList: ['Payment ID', 'Date & Time', 'Amount', 'Status']),
        const VerticalSpacing(10),
        UserParentLiveGfitingPayoutTableBody(onTap: () {}),
      ],
    );
  }
}

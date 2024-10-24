import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/common_back_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/live_gifting_contribution_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_live_gifting_widget.dart';
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
                        TabBarWidget(
                          controller: PageController(),
                          title: const [
                            'Live Giftings',
                            'Previous Giftings',
                            'Activity'
                          ],
                          onTap: () {},
                        ),
                        const VerticalSpacing(20),
                        // Expanded(
                        //   child: PageView(
                        //     children: [
                        //       SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        GetBuilder<SideBarController>(
                          builder: (controller) {
                            return Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.cardGrey,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TabBarWidget(
                                    controller:
                                        controller.liveGiftingPageController,
                                    selectedColor: AppColors.white,
                                    title: const [
                                      'Gifting Details',
                                      'Contributions',
                                      'Payout'
                                    ],
                                    onTap: () {
                                      controller.liveGiftingPageController
                                          .animateToPage(
                                              controller.selectedIndex,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.ease);
                                      controller.update();
                                    },
                                  ),
                                  SizedBox(
                                    height: context.height,
                                    child: PageView(
                                      padEnds: false,
                                      controller:
                                          controller.liveGiftingPageController,
                                      children: [
                                        const ParentLiveGiftingsWidget(),
                                        Column(
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
                                            VerticalSpacing(10),
                                            InkWell(
                                              onTap: (){

                                              },
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
                                                              side: const BorderSide(color: AppColors.grey, width: 1),
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
                                        ),
                                        Container(
                                          color: AppColors.primaryLight,
                                        )
                                      ],
                                    ),
                                  ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonText(
                          text: 'Beneficiaries',
                          fontSize: 20,
                          weight: FontWeight.w600,
                        ),
                        const VerticalSpacing(20),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardGrey,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileTile(),
                              VerticalSpacing(18),
                              CommonTile(
                                title: 'Age',
                                subTitle: '16 years',
                              ),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Phone', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Received Contributions',
                                  subTitle: '\$ 150.00'),
                              VerticalSpacing(20),
                              CommonText(
                                text: 'Bank Details',
                                fontSize: 20,
                                weight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Bank', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Account Type',
                                  subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Account Owner Name',
                                  subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'City ', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'State', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Zip', subTitle: '+1 012-456-789'),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.cardGrey,
                            ),
                            child: const ProfileTile()),
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

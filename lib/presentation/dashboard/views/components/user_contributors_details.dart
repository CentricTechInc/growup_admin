import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/common_back_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/common_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/profile_tile.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/tab_bar_widget.dart';

class UserContributerDetails extends StatelessWidget {
  const UserContributerDetails({super.key});

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

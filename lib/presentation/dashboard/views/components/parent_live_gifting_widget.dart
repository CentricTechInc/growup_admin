import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';

class ParentLiveGiftingsWidget extends StatelessWidget {
  const ParentLiveGiftingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(20),
          Row(
            children: [
              SizedBox(
                height: 140,
                width: 210,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                              Assets.schoolImg,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          stops: [0, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: AppColors.bwGradient,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: 'help Us Succeed',
                            fontSize: 16,
                            weight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const HorizontalSpacing(20),
              Expanded(
                child: Column(
                  children: [
                    const VerticalSpacing(20),
                    Row(
                      children: [
                        const Expanded(
                          child: CommonText(
                            text: 'Total Gifting',
                            fontSize: 16,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const Expanded(
                          child: CommonText(
                            text: 'Total Gifting 2',
                            fontSize: 16,
                            weight: FontWeight.w700,
                          ),
                        ),
                        const Expanded(
                          child: CommonText(
                            text: 'Total Gifting 3',
                            fontSize: 16,
                            weight: FontWeight.w700,
                          ),
                        )
                      ],
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
            ],
          ),
          const VerticalSpacing(20),
          const CommonText(
            text: 'Description',
            fontSize: 16,
            weight: FontWeight.w700,
          ),
          const VerticalSpacing(10),
          const CommonText(
            text:
                'Help John achieve his dream of attending college! Your contributions will cover tuition, books, and living expenses, enabling him to focus on his studies. Every donation brings him one step closer to a bright future. Thank you for your support!',
            fontSize: 16,
            weight: FontWeight.w400,
            color: AppColors.secondaryText,
          ),
          const VerticalSpacing(60),
          const Divider(
            color: AppColors.grey,
          ),
          const VerticalSpacing(20),
          const CommonText(
            text: 'Beneficiary Account Details',
            fontSize: 20,
            weight: FontWeight.w700,
          ),
          const VerticalSpacing(20),
          Row(
            children: List.generate(
              4,
              (index) => const Expanded(
                child: CommonText(
                  text: 'Bank',
                  fontSize: 16,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const VerticalSpacing(10),
          Row(
            children: List.generate(
              4,
              (index) => const Expanded(
                child: CommonText(
                  text: 'City Bank',
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
              4,
              (index) => index == 3
                  ? const Spacer()
                  : const Expanded(
                      child: CommonText(
                        text: 'Bank',
                        fontSize: 16,
                        weight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
          const VerticalSpacing(10),
          Row(
            children: List.generate(
              4,
              (index) => index == 3
                  ? const Spacer()
                  : const Expanded(
                      child: CommonText(
                        text: 'City Bank',
                        fontSize: 16,
                        weight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

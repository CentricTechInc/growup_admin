import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

class ParentLiveGiftingsWidget extends StatelessWidget {
  const ParentLiveGiftingsWidget({super.key, required this.giftingModel});

  final GiftingModel giftingModel;

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
                width: Responsive.isDesktop(context) ? 210 : 140,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(giftingModel.picture ?? ''),
                            onError: (object, _) {
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: Icon(
                                  Icons.error_outline,
                                  color: AppColors.red,
                                ),
                              );
                            },
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: giftingModel.title ?? '',
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
              Responsive.isDesktop(context)
                  ? Expanded(
                      child: Column(
                        children: [
                          const VerticalSpacing(20),
                          const Row(
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: 'Gifting Purpose',
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: CommonText(
                                  text: 'Date & Time',
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: CommonText(
                                  text: 'Gifting Status',
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
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    giftingModel.purpose ?? '',
                                    giftingModel.createdAt ?? '',
                                    giftingModel.status?.name ?? ''
                                  ][index],
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                  color: index == 2
                                      ? AppColors.primary
                                      : AppColors.secondaryText,
                                ),
                              ),
                            ),
                          ),
                          const VerticalSpacing(20),
                          Row(
                            children: List.generate(
                              3,
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    'Gifting Frequency',
                                    'Gifting Total',
                                    'Benefeciary Name',
                                  ][index],
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
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    giftingModel.frequency ?? '',
                                    '\$ ${giftingModel.contributionTotal}' ??
                                        '',
                                    giftingModel.beneficiary?.name ?? '',
                                  ][index],
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: 'Gifting Purpose',
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: CommonText(
                                  text: 'Date & Time',
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              VerticalSpacing(10),
                            ],
                          ),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    giftingModel.purpose ?? '',
                                    giftingModel.createdAt ?? '',
                                  ][index],
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
                              2,
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    'Gifting Status',
                                    'Gifting Frequency',
                                  ][index],
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const VerticalSpacing(10),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    giftingModel.status?.name ?? '',
                                    giftingModel.frequency ?? '',
                                  ][index],
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                  color: index == 0
                                      ? AppColors.primary
                                      : AppColors.secondaryText,
                                ),
                              ),
                            ),
                          ),
                          const VerticalSpacing(20),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    'Gifting Total',
                                    'benefeciary Name',
                                  ][index],
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const VerticalSpacing(10),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Expanded(
                                child: CommonText(
                                  text: [
                                    '\$ ${giftingModel.contributionTotal}' ??
                                        '',
                                    giftingModel.beneficiary?.name ?? '',
                                  ][index],
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
          CommonText(
            text: giftingModel.description ?? '',
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
              (index) => Expanded(
                child: CommonText(
                  text: [
                    'Bank',
                    'Account',
                    'Account Owner Name',
                    'Account Number',
                  ][index],
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
              (index) => Expanded(
                child: CommonText(
                  text: [
                    giftingModel.beneficiary?.bank ?? '',
                    giftingModel.beneficiary?.accountType ?? '',
                    giftingModel.beneficiary?.accountOwnerName ?? '',
                    giftingModel.beneficiary?.accountNumber ?? '',
                  ][index],
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
                  : Expanded(
                      child: CommonText(
                        text: [
                          'City',
                          'State',
                          'Zip',
                        ][index],
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
                  : Expanded(
                      child: CommonText(
                        text: [
                          giftingModel.beneficiary?.city ?? '',
                          giftingModel.beneficiary?.state ?? '',
                          giftingModel.beneficiary?.zip ?? '',
                        ][index],
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

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/data/dto/user_dto.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

class GiftingListCard extends StatelessWidget {
  const GiftingListCard({
    super.key,
    required this.giftingModel,
    required this.onDelete,
  });

  final GiftingModel giftingModel;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
            children: [
              Expanded(
                flex: 10,
                child: CommonText(
                  text: giftingModel.title ?? '',
                  fontSize: 16,
                  weight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Tooltip(
                message: giftingModel.frequency ?? '',
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5.5,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.calendarIcon,
                        scale: 1.7,
                        color: AppColors.secondary,
                      ),
                      const HorizontalSpacing(10),
                      Expanded(
                        child: CommonText(
                          text: giftingModel.frequency ?? '',
                          fontSize: 16,
                          weight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HorizontalSpacing(30),
              Tooltip(
                message: '\$${giftingModel.contributionTotal}',
                child: Container(
                  width: 190,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.dollorIcon,
                        scale: 2,
                        color: AppColors.primary,
                      ),
                      const HorizontalSpacing(10),
                      Expanded(
                        child: CommonText(
                          text: '\$ ${giftingModel.contributionTotal}',
                          fontSize: 16,
                          weight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const HorizontalSpacing(5),
                      const CommonText(
                        text: 'Giftings Total',
                        fontSize: 12,
                        weight: FontWeight.w700,
                        color: AppColors.secondaryText,
                      ),
                    ],
                  ),
                ),
              ),
              const HorizontalSpacing(30),
              LocalStorageService.instance.user?.role == Roles.Admin
                  ? CommonIconButton(
                      icon: Assets.deleteIcon,
                      onTap: onDelete,
                      color: AppColors.red,
                    )
                  : const SizedBox.shrink(),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: CommonText(
                      text: giftingModel.title ?? '',
                      fontSize: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  LocalStorageService.instance.user?.role == Roles.Admin
                      ? CommonIconButton(
                          icon: Assets.deleteIcon,
                          onTap: onDelete,
                          color: AppColors.red,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const VerticalSpacing(25),
              Row(
                children: [
                  Tooltip(
                    message: giftingModel.frequency ?? '',
                    child: Container(
                      width: 110,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5.5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Assets.calendarIcon,
                            scale: 1.7,
                            color: AppColors.secondary,
                          ),
                          const HorizontalSpacing(10),
                          Expanded(
                            child: CommonText(
                              text: giftingModel.frequency ?? '',
                              fontSize: 16,
                              weight: FontWeight.w700,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const HorizontalSpacing(30),
                  Tooltip(
                    message: '\$${giftingModel.contributionTotal}',
                    child: Container(
                      width: 190,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5.5,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Assets.dollorIcon,
                            scale: 2,
                            color: AppColors.primary,
                          ),
                          const HorizontalSpacing(10),
                          Expanded(
                            child: CommonText(
                              text: '\$ ${giftingModel.contributionTotal}',
                              fontSize: 16,
                              weight: FontWeight.w700,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const HorizontalSpacing(5),
                          const CommonText(
                            text: 'Giftings Total',
                            fontSize: 12,
                            weight: FontWeight.w700,
                            color: AppColors.secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const HorizontalSpacing(30),
                ],
              )
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/title_with_value_widget.dart';

class PaymentDetailsDialogBox extends StatelessWidget {
  const PaymentDetailsDialogBox({
    super.key,
    this.model,
  });

  final ContributionModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 30),
      width: context.width / 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const CommonText(
                  text: 'Payment Details',
                  fontSize: 20,
                  weight: FontWeight.w700,
                ),
                const Spacer(),
                CommonIconButton(
                  icon: Assets.cancelIcon,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: AppColors.grey,
                )
              ],
            ),
            const VerticalSpacing(20),
            const Divider(
              color: AppColors.grey,
              thickness: 1.5,
            ),
            const VerticalSpacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithValueWidget(
                      title: 'Payment ID',
                      value: model?.transactionId ?? '',
                    ),
                    const VerticalSpacing(20),
                    TitleWithValueWidget(
                      title: 'Benefeciary Name',
                      value: model?.beneficiary ?? '',
                    ),
                    const VerticalSpacing(20),
                    TitleWithValueWidget(
                      title: 'Frequency',
                      value: model?.frequency?.name ?? '',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithValueWidget(
                      title: 'Gifting Title',
                      value: model?.gift?.title ?? '',
                    ),
                    const VerticalSpacing(20),
                    const TitleWithValueWidget(
                      title: 'Payment Gateway',
                      value: 'Stripe',
                    ),
                    const VerticalSpacing(20),
                    TitleWithValueWidget(
                      title: 'Amount',
                      value: '\$ ${model?.amount}' ?? '',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithValueWidget(
                      title: 'Parent Name',
                      value: model?.user?.name ?? '',
                    ),
                    const VerticalSpacing(20),
                    TitleWithValueWidget(
                      title: 'Date & Time',
                      value: model?.createdAt ?? '',
                    ),
                    const VerticalSpacing(20),
                    TitleWithValueWidget(
                      title: 'Status',
                      value: model?.status?.name ?? 'Successful',
                      txtColor: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


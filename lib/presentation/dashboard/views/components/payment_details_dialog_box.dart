import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

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
            Row(children: [
              Expanded(
                  child: TitleWithValueWidget(
                title: 'Gifting Title',
                value: model?.gift?.title ?? '',
              )),
              const HorizontalSpacing(10),
              Expanded(
                  child: TitleWithValueWidget(
                title: 'Contributor',
                value: model?.contributor ?? '',
              )),
              const HorizontalSpacing(10),
              Expanded(
                  child: TitleWithValueWidget(
                title: 'Benefeciary Name',
                value: model?.beneficiary ?? '',
              )),
            ]),
            const VerticalSpacing(10),
            Row(children: [
              Expanded(
                  child: TitleWithValueWidget(
                title: 'Date & Time',
                value: model?.createdAt ?? '',
              )),
              const HorizontalSpacing(10),
              Expanded(
                  child: TitleWithValueWidget(
                title: 'Frequency',
                value: model?.frequency?.name ?? '',
              )),
              const HorizontalSpacing(10),
              Expanded(
                  child: TitleWithValueWidget(
                title: 'Amount',
                value: model?.amount ?? '',
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

class TitleWithValueWidget extends StatelessWidget {
  const TitleWithValueWidget(
      {super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: title,
          fontSize: 16,
          weight: FontWeight.w700,
        ),
        const VerticalSpacing(10),
        CommonText(
          text: value,
          fontSize: 16,
          weight: FontWeight.w700,
          color: AppColors.grey,
        ),
      ],
    );
  }
}

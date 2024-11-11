import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

class PaymentDetailsDialogBox extends StatelessWidget {
  const PaymentDetailsDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 30),
      height: context.height / 3,
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
    );
  }
}

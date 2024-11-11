import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/icon_button.dart';

class AdjustTaxDialogBox extends StatelessWidget {
  const AdjustTaxDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 30),
      height: context.height / 2.4,
      width: context.width / 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CommonText(
                  text: 'Adjust Fees and Taxes',
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
            const CommonText(
              text: 'Platform Fees (Deductions)',
              fontSize: 16,
              weight: FontWeight.w700,
            ),
            const VerticalSpacing(10),
            SizedBox(
              width: context.width,
              child: CommonTextField(
                controller: TextEditingController(),
                hintText: '3',
                isFilledColor: true,
                borderColor: AppColors.transparent,
                enableBorder: AppColors.transparent,
                suffix: Image.asset(
                  Assets.percentIcon,
                  scale: 1.5,
                ),
              ),
            ),
            const VerticalSpacing(30),
            const CommonText(
              text: 'Tax (Deductions)',
              fontSize: 16,
              weight: FontWeight.w700,
            ),
            const VerticalSpacing(10),
            SizedBox(
              width: context.width,
              child: CommonTextField(
                controller: TextEditingController(),
                hintText: '5',
                isFilledColor: true,
                borderColor: AppColors.transparent,
                enableBorder: AppColors.transparent,
                suffix: Image.asset(
                  Assets.percentIcon,
                  scale: 1.5,
                ),
              ),
            ),
            const VerticalSpacing(40),
            Row(
              children: [
                const Spacer(),
                CommonTextButton(
                  onPressed: () {},
                  text: 'Save',
                  height: 40,
                  width: 120,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

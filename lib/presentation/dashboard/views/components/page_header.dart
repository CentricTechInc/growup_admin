import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_field.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/common/resources/strings.dart';

// ignore: must_be_immutable
class PageHeader extends StatelessWidget {
  PageHeader({
    super.key,
    required this.label,
    this.showTaxBtn = false,
    this.showSearch = true,
    this.searchOnChanged,
    this.searchController,
    this.taxBtnOnTap,
    this.searchCancelOnTap,
    this.hintText,
    this.exportOnTap,
    this.calendarOnTap,
    this.calendarselectedIndex,
    this.calendarlabel,
  });

  final String label;
  final bool showTaxBtn;
  final bool showSearch;
  final VoidCallback? taxBtnOnTap;
  final VoidCallback? searchCancelOnTap;
  final VoidCallback? exportOnTap;
  final TextEditingController? searchController;
  dynamic Function(String)? searchOnChanged;
  final String? hintText;
  final VoidCallback? calendarOnTap;
  final int? calendarselectedIndex;
  final String? calendarlabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonText(
          text: label,
          fontSize: 24,
          weight: FontWeight.w700,
        ),
        const Spacer(),
        if (exportOnTap != null)
          InkWell(
            onTap: exportOnTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  const Icon(
                    Icons.table_chart,
                    color: AppColors.primary,
                  ),
                  if (Responsive.isDesktop(context))
                    const HorizontalSpacing(10),
                  if (Responsive.isDesktop(context))
                    const CommonText(
                      text: 'Export Table',
                      fontSize: 16,
                      weight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                ],
              ),
            ),
          ),
        const HorizontalSpacing(10),
        if (calendarOnTap != null)
          Container(
            width: Responsive.isDesktop(context) ? 240 : 70,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Image.asset(
                  Assets.calendarIcon,
                  color: AppColors.primary,
                  scale: 2,
                ),
                if (Responsive.isDesktop(context)) const HorizontalSpacing(10),
                if (Responsive.isDesktop(context))
                  CommonText(
                    text: getCalendarLabel(calendarlabel ?? '') ?? 'Select',
                    fontSize: 16,
                    weight: FontWeight.w500,
                  ),
                const Spacer(),
                InkWell(
                    onTap: calendarOnTap,
                    child: const Icon(Icons.keyboard_arrow_down_outlined))
              ],
            ),
          ),
        if (showTaxBtn) const HorizontalSpacing(10),
        if (showTaxBtn)
          InkWell(
            onTap: taxBtnOnTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 0.5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const CommonText(
                text: 'Adjust Fees and Taxes',
                fontSize: 16,
                weight: FontWeight.w500,
              ),
            ),
          ),
        if (showSearch) const HorizontalSpacing(10),
        if (showSearch)
          SizedBox(
            height: 40,
            width: Responsive.isDesktop(context)
                ? context.width * 0.2
                : context.width * 0.25,
            // constraints: BoxConstraints(
            //   maxWidth: 300,
            //   minWidth: 100,
            // ),
            child: CommonTextField(
              prefix: Image.asset(
                Assets.searchIcon,
                scale: 2,
              ),
              hintText: hintText ?? 'Search by name, email, phone',
              hintColor: AppColors.secondaryText,
              suffixIcon: Icons.cancel_rounded,
              suffixIconOnTap: searchCancelOnTap,
              isBorderEnabled: true,
              isFilledColor: false,
              borderColor: AppColors.primary,
              enableBorder: AppColors.primary,
              controller: searchController ?? TextEditingController(),
              onChanged: searchOnChanged,
            ),
          ),
      ],
    );
  }
}

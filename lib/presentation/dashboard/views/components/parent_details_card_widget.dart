import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class ParentDetailsCardWidget extends StatelessWidget {
  const ParentDetailsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
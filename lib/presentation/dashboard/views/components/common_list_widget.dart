import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonListWidget extends StatelessWidget {
  const CommonListWidget({
    super.key,
    this.title,
    required this.header,
    required this.body,
    required this.onTap,
  });

  final String? title;
  final Widget header;
  final Widget body;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.background, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (title != null)
                CommonText(
                    text: title ?? '', fontSize: 30, weight: FontWeight.bold),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const CommonText(
                    text: 'View All',
                    fontSize: 12,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (title != null) const VerticalSpacing(20),
          SizedBox(
              height: 30,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  child: header)),
          const SizedBox(
            height: 10,
          ),
          body
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class StatusCardWidget extends StatelessWidget {
  const StatusCardWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: title == 'Deleted'
            ? AppColors.red.withOpacity(0.2)
            : title != 'Expired'
            ? AppColors.primary.withOpacity(0.2)
            : AppColors.grey,
      ),
      child: CommonText(
        textAlign: TextAlign.center,
        text: title,
        color: title == 'Deleted'
            ? AppColors.red
            : title != 'Expired'
            ? AppColors.primary
            : AppColors.primaryText,
        fontSize: 12,
        weight: FontWeight.w400,
      ),
    );
  }
}

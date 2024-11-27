import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CalendarSelectionCard extends StatelessWidget {
  const CalendarSelectionCard(
      {super.key,
        required this.title,
        required this.isSelected,
        required this.onTap});

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greyish : AppColors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            CommonText(
              text: title,
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            const Spacer(),
            if (isSelected) const Icon(Icons.check),
          ],
        ),
      ),
    );
  }
}

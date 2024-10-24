import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';

class ParentTableBody extends StatelessWidget {
  const ParentTableBody({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Checkbox(
                      value: false,
                      activeColor: AppColors.primary,
                      splashRadius: 10,
                      onChanged: (p0) {},
                      side: const BorderSide(color: AppColors.grey, width: 1),
                    ),
                  ),
                  const HorizontalSpacing(30),
                  const CommonText(
                    text: '#HS5896',
                    fontSize: 12,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            const CommonVerticalDivider(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: AppColors.grey,
              thickness: 2,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: 'Jason Borne',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            const CommonVerticalDivider(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: AppColors.grey,
              thickness: 2,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: 'jasonborne@abc.com',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            const CommonVerticalDivider(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: AppColors.grey,
              thickness: 2,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: '+ 0000 0000 000',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(Assets.shareIcon, scale: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

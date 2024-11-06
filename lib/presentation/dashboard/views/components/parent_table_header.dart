import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class ParentTableHeader extends StatelessWidget {
  const ParentTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
class GiftingTableHeader extends StatelessWidget {
  const GiftingTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[4],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: CommonText(
                textAlign: TextAlign.right,
                text: titleList[5],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[6],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
class PayoutTableHeader extends StatelessWidget {
  const PayoutTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[4],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: CommonText(
                textAlign: TextAlign.right,
                text: titleList[5],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
class ContributionTableHeader extends StatelessWidget {
  const ContributionTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[4],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: CommonText(
                textAlign: TextAlign.right,
                text: titleList[5],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[6],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[7],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[8],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
class UserParentLiveGfitingPayoutTableHeader extends StatelessWidget {
  const UserParentLiveGfitingPayoutTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class UserParentACtivityTableHeader extends StatelessWidget {
  const UserParentACtivityTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),

          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[4],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),

          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[5],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),

          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[6],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';

class ParentDetailsCardWidget extends StatelessWidget {
  ParentDetailsCardWidget({super.key, required this.giftModel});
  GiftDetailDto giftModel;
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
          const Row(children: [
            Expanded(
              child: CommonText(
                text: 'Name',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: CommonText(
                text: 'Email',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: CommonText(
                text: 'Phone',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ),
          ]),
          const VerticalSpacing(10),
          Row(children: [
            Expanded(
              child: CommonText(
                text: giftModel.data?.user?.name ?? '',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: giftModel.data?.user?.email ?? '',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: giftModel.data?.user?.phone ?? '',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
          ]),
          const VerticalSpacing(20),
          const Row(children: [
            Expanded(
              child: CommonText(
                text: 'Total Giftings',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: CommonText(
                text: 'Recieved',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: CommonText(
                text: 'Contributed',
                fontSize: 16,
                weight: FontWeight.w700,
              ),
            ),
          ]),
          const VerticalSpacing(10),
          Row(children: [
            Expanded(
              child: CommonText(
                text: giftModel.data?.totalGifts.toString() ?? '0',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: giftModel.data?.recieved.toString() ?? '0',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: giftModel.data?.contributed.toString() ?? '0',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

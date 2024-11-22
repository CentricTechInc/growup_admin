import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';

class DetailsCardWidget extends StatelessWidget {
  DetailsCardWidget(
      {super.key,
      required this.giftModel,
      required this.parentModel,
      required this.title});

  final String title;
  GiftDetailDto giftModel;
  ParentModel parentModel;

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
          CommonText(
            text: title,
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
                text: parentModel.name ?? '',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: parentModel.email ?? '',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: parentModel.phone ?? '',
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
                text: '${parentModel.totalGifts?? '0'}',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: '\$ ${parentModel.totalReceived?? '0'}' ,
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Expanded(
              child: CommonText(
                text: '\$ ${parentModel.totalContributed ?? 0}',
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

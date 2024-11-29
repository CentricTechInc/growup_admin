import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';

class PayoutBodyWidget extends StatelessWidget {
  const PayoutBodyWidget({super.key, required this.payoutList});
  final List<PayoutObject>? payoutList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: payoutList?.length ?? 0,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: '${payoutList?[index].id ?? 0}',
                      textAlign: TextAlign.center,
                      fontSize: 10),
                ),
                const CommonVerticalDivider(),
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: payoutList?[index].gift?.title ?? '',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: payoutList?[index].parent ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 10),
                ),
                const CommonVerticalDivider(),
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: payoutList?[index].beneficiary ?? '',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: payoutList?[index].createdAt ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 9),
                ),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      text: '\$ ${payoutList?[index].amount}' ?? '',
                      fontSize: 10),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.grey,
        ),
      ),
    );
  }
}

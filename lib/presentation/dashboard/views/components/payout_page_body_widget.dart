import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class PayoutPageBodyWidget extends StatelessWidget {
  const PayoutPageBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Row(
            children: [
              Expanded(
                  child: CommonText(
                      textAlign: TextAlign.center,
                      text: 'Payment ID',
                      fontSize: 12,
                      weight: FontWeight.bold)),
              VerticalDivider(
                color: AppColors.grey,
                thickness: 2,
              ),
              Expanded(
                child: CommonText(
                    textAlign: TextAlign.center,
                    text: 'Gifting Title',
                    fontSize: 12,
                    weight: FontWeight.bold),
              ),
              VerticalDivider(
                color: AppColors.grey,
                thickness: 2,
              ),
              Expanded(
                child: CommonText(
                    textAlign: TextAlign.center,
                    text: 'Parent Name',
                    fontSize: 12,
                    weight: FontWeight.bold),
              ),
              VerticalDivider(
                color: AppColors.grey,
                thickness: 2,
              ),
              Expanded(
                child: CommonText(
                    textAlign: TextAlign.center,
                    text: 'Beneficiary Name',
                    fontSize: 12,
                    weight: FontWeight.bold),
              ),
              VerticalDivider(
                color: AppColors.grey,
                thickness: 2,
              ),
              Expanded(
                  child: CommonText(
                      textAlign: TextAlign.center,
                      text: 'Date & Time',
                      fontSize: 12,
                      weight: FontWeight.bold)),
              VerticalDivider(
                color: AppColors.grey,
                thickness: 2,
              ),
              Expanded(
                  child: CommonText(
                      textAlign: TextAlign.center,
                      text: 'Payout Amount',
                      fontSize: 12,
                      weight: FontWeight.bold)),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemCount: 3,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';

class RecentContributionBodyWidget extends StatelessWidget {
  const RecentContributionBodyWidget({
    super.key,
    required this.recentContributions,
  });
  final List<RecentContributions>? recentContributions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: recentContributions?.length ?? 0,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: recentContributions?[index]
                                .transactionId
                                .toString() ??
                            '',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: recentContributions?[index].gift?.title ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 10),
                ),
                const CommonVerticalDivider(),
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: recentContributions?[index].createdAt ?? '',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: recentContributions?[index].frequency ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 9),
                ),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      text: recentContributions?[index].amount ?? '',
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

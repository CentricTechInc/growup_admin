import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/status_card_widget.dart';

class RecentUsersBodyWidget extends StatelessWidget {
  const RecentUsersBodyWidget({super.key, required this.recentUsersObject});

  final List<RecentUsersObject>? recentUsersObject;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: recentUsersObject?.length ?? 0,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: recentUsersObject?[index].id.toString() ?? '',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: recentUsersObject?[index].name ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 10),
                ),
                const CommonVerticalDivider(),
                Expanded(
                    child: CommonText(
                        weight: FontWeight.bold,
                        text: recentUsersObject?[index].email ?? '',
                        textAlign: TextAlign.center,
                        fontSize: 10)),
                const CommonVerticalDivider(),
                Expanded(
                  child: CommonText(
                      weight: FontWeight.bold,
                      text: recentUsersObject?[index].phone ?? '',
                      textAlign: TextAlign.center,
                      fontSize: 9),
                ),
                const CommonVerticalDivider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: StatusCardWidget(
                        title: recentUsersObject?[index].status ?? ''),
                  ),
                ),
                // Expanded(
                //   child: CommonText(
                //       weight: FontWeight.bold,
                //       textAlign: TextAlign.center,
                //       text: recentUsersObject?[index].status ?? '',
                //       fontSize: 10),
                // )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
        const Divider(
          color: AppColors.grey,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/strings.dart';
import 'package:pager/pager.dart';

class CommonPagerWidget extends StatelessWidget {
  const CommonPagerWidget(
      {super.key,
      required this.currentPage,
      required this.totalPage,
      required this.onPageChanged,
      this.showItemsPerPageBool = false,
      this.currentItemsPerPage,
      this.onItemsPerPageChanged,
      this.itemsPerPageList});

  final int currentPage;
  final int? currentItemsPerPage;
  final Function(int)? onItemsPerPageChanged;
  final List<int>? itemsPerPageList;
  final Function(int) onPageChanged;
  final bool? showItemsPerPageBool;
  final int totalPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        const CommonText(
          text: 'Page size',
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        const HorizontalSpacing(10),
        // SizedBox(
        //   width: 60,
        //   child: CommonDropDownWidget(
        //     borderColor: AppColors.primary,
        //     disableBorder: AppColors.primary,
        //     onChanged: (p0) {},
        //     arryList: List.generate(totalPage, (index) => index.toString()),
        //     selectedItem: 1,
        //   ),
        // ),
        // const HorizontalSpacing(30),
        CommonText(
          text: '$currentPage-$currentItemsPerPage of  $totalPage',
          fontSize: 12,
          weight: FontWeight.w600,
        ),
        const HorizontalSpacing(33),
        Pager(
          currentPage: currentPage,
          showItemsPerPage: showItemsPerPageBool ?? false,
          currentItemsPerPage: currentItemsPerPage,
          onItemsPerPageChanged: onItemsPerPageChanged,
          itemsPerPageList: itemsPerPageList,
          onPageChanged: onPageChanged,
          totalPages: totalPage,
          dropDownMenuItemTextStyle:
              const TextStyle(fontFamily: Strings.fontFamily, fontSize: 14),
          itemsPerPageTextStyle: const TextStyle(
              fontSize: 14,
              fontFamily: Strings.fontFamily,
              fontWeight: FontWeight.w500),
          numberButtonSelectedColor: AppColors.primary,
          numberTextSelectedColor: AppColors.white,
          numberTextUnselectedColor: AppColors.primary,
          pageChangeIconColor: AppColors.primary,
          itemsPerPageText: 'Page Size',
        ),
      ],
    );
  }
}

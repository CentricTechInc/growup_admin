import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget(
      {super.key,
      required this.title,
      this.selectedColor,
      this.unselectedColor,
      required this.controller,
      required this.onTap,
      required this.selectedIndex,
      this.txtColor});

  final List<String> title;
  final Color? selectedColor;
  final Color? unselectedColor;
  final PageController controller;
  final Function(int) onTap;
  final int selectedIndex;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (ctrl) {
      return Row(
        children: List.generate(
          title.length,
          (index) => InkWell(
            // onTap: onTap,
            onTap: () {
              // ctrl.userParentSelectedIndex = index;
              controller.animateToPage(
                  // ctlr.selectedIndex,
                  index,
                  duration: const Duration(seconds: 1),
                  curve: Curves.ease);
              onTap(index);

              ctrl.update();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index == selectedIndex
                      ? selectedColor ?? AppColors.greyish
                      : unselectedColor ?? AppColors.transparent,
                ),
                child: CommonText(
                  text: title[index],
                  fontSize: 16,
                  weight: FontWeight.w600,
                  color: txtColor ?? AppColors.primaryText,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

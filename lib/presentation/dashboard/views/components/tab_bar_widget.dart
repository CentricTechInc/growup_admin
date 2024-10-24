import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget(
      {super.key,
        required this.title,
        this.selectedColor,
        this.unselectedColor,
        required this.controller,
        required this.onTap});

  final List<String> title;
  final Color? selectedColor;
  final Color? unselectedColor;
  final PageController controller;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (ctlr) {
      return Row(
        children: List.generate(
          title.length,
              (index) => InkWell(
            onTap: () {
              ctlr.selectedIndex = index;
              onTap;
              controller
                  .animateToPage(
                  ctlr.selectedIndex,
                  duration:
                  const Duration(seconds: 1),
                  curve: Curves.ease);
              ctlr.update();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index == ctlr.selectedIndex
                      ? selectedColor ?? AppColors.greyish
                      : unselectedColor ?? AppColors.transparent,
                ),
                child: CommonText(
                  text: title[index],
                  fontSize: 16,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

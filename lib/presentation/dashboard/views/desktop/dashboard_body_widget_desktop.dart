import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_app_bar.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';

class DashboardBodyWidgetDesktop extends StatelessWidget {
  const DashboardBodyWidgetDesktop({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: context.width * 0.85,
        color: AppColors.white,
        child: Column(
          children: [
            CommonAppBar(),
            Container(
              height: context.height - 80,
              decoration: const BoxDecoration(
                color: AppColors.greyish,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: child,
            )
          ],
        ),
      );
    });
  }
}

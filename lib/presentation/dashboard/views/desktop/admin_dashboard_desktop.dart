import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/dashboard_body_widget_desktop.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/side_bar_widget.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({
    super.key,
    required this.child,
  });

  final Widget child;

  final controller = Get.find<SideBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.drawerKey,
      drawer: !Responsive.isDesktop(context)
          ? const Drawer(
              child: SideBarWidget(),
            )
          : const SizedBox(),
      body: Container(
        color: AppColors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) const SideBarWidget(),
            DashboardBodyWidgetDesktop(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}

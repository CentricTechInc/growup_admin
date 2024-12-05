import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/responsive_builder.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';

class CommonAppBar extends StatelessWidget {
  CommonAppBar({
    super.key,
    this.showSearchBar = false,
    this.onChanged,
  });

  final bool? showSearchBar;
  final void Function(String)? onChanged;
  final controller = Get.find<SideBarController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          !Responsive.isDesktop(context)
              ? InkWell(
                  onTap: () {
                    controller.drawerKey.currentState?.openDrawer();
                    print(controller.drawerKey.currentState?.isDrawerOpen);
                    controller.update();
                    print('here');
                  },
                  child: const Icon(Icons.menu_rounded),
                )
              : const SizedBox(),
          if (showSearchBar ?? false)
            Container(
              width: 400,
              padding: const EdgeInsets.all(15),
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: AppColors.grey),
                  filled: true,
                  fillColor: AppColors.greyish,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    height: 33,
                    width: 33,
                    Assets.profileImg,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CommonText(
                  text: LocalStorageService.instance.user?.name ?? 'John',
                  fontSize: 15,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {
              context.go(PagePath.login);
            },
            child: Row(
              children: [
                Image.asset(
                  height: 20,
                  width: 20,
                  Assets.logoutIcon,
                  scale: 1.5,
                ),
                const SizedBox(
                  width: 10,
                ),
                const CommonText(
                  text: 'Log Out',
                  fontSize: 15,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

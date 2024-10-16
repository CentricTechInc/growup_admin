import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/extensions/build_context_ext.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';

class CommonAuthWidget extends StatelessWidget {
  const CommonAuthWidget(
      {super.key,
      required this.child,
      this.padding,
      this.showLogo = true,
      this.showBackButton = false});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showLogo, showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Row(
        children: [
          if (showLogo)
            Container(
              color: AppColors.primary,
              height: context.height,
              width: context.width * 0.4,
              child: Image.asset(
                Assets.hands,
                fit: BoxFit.cover,
              ),
            ),
          if (!showLogo) const Spacer(),
          Stack(
            children: [
              Container(
                  padding: padding ??
                      EdgeInsets.symmetric(horizontal: context.width * 0.15),
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  width: showLogo ? context.width * 0.6 : context.width * 0.9,
                  child: child),
              if (showBackButton)
                const Positioned(left: 20, top: 20, child: BackButton()),
            ],
          )
        ],
      ),
    );
  }
}

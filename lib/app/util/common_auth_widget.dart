import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/extensions/build_context_ext.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonAuthWidget extends StatelessWidget {
  const CommonAuthWidget(
      {super.key, required this.child, this.padding, this.showLogo = true});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Row(
        children: [
          if (showLogo)
            // Expanded(
            //   child: Container(
            //     color: AppColors.primary,
            //     width: context.width * 0.4,
            //     child: Center(
            //       child: Image.asset(
            //         AssetIcons.whiteLogo,
            //         scale: 8,
            //       ),
            //     ),
            //   ),
            // ),
            if (!showLogo) const Spacer(),
          Container(
              padding: padding ??
                  EdgeInsets.symmetric(horizontal: context.width * 0.15),
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              width: showLogo ? context.width * 0.6 : context.width * 0.9,
              child: child)
        ],
      ),
    );
  }
}

import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_text_button.dart';
import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:sizer/sizer.dart';

class CommonDialogBox extends StatelessWidget {
  const CommonDialogBox({
    super.key,
    this.contentText,
    this.buttonText,
    required this.title,
    required this.icon,
    this.isContent = false,
    this.isButton = false,
    this.onTap,
    this.cancelOnTap,
  });

  final String icon;
  final String? contentText;
  final String? buttonText;
  final String title;
  final bool isContent;
  final bool isButton;
  final void Function()? onTap;
  final void Function()? cancelOnTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              if (cancelOnTap != null) {
                cancelOnTap!();
              }
            },
            child: Image.asset(
              Assets.cancelIcon,
              scale: 2,
            ),
          ),
          Center(
            child: ImageIcon(
              AssetImage(icon),
              size: 150,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
      content: isContent
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: CommonText(
                textAlign: TextAlign.center,
                text: contentText!,
                weight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.secondaryText,
              ),
            )
          : null,
      title: CommonText(
        textAlign: TextAlign.center,
        text: title,
        fontSize: 16.sp,
        color: AppColors.black,
        weight: FontWeight.bold,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        if (isButton)
          CommonTextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onTap != null) {
                onTap!();
              }
            },
            text: buttonText!,
            fontSize: 12.sp,
          ),
      ],
    );
  }
}

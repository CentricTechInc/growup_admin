
import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonSwitchWidget extends StatelessWidget {
  const CommonSwitchWidget(
      {super.key, required this.isSwitched, this.onChanged});
  final bool isSwitched;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: onChanged,
      value: isSwitched,
      thumbColor: MaterialStateColor.resolveWith((states) => AppColors.white),
      trackOutlineColor: MaterialStateColor.resolveWith(
        (states) => AppColors.white,
      ),
      activeColor: AppColors.white,
      activeTrackColor: AppColors.primary,
      inactiveThumbColor: AppColors.white,
      // inactiveTrackColor: AppColors.lightGreyish,
    );
  }
}

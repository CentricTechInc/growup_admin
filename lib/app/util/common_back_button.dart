import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 25,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          Assets.backButton,
          height: 20,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  const CommonIconButton(
      {super.key,
        required this.icon,
        required this.onTap,
        required this.color});

  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(6.25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.08),
        ),
        child: Image.asset(icon),
      ),
    );
  }
}

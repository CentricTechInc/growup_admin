import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;
}

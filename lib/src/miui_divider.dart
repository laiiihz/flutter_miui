import 'package:flutter/material.dart';

/// A thin horizontal line, with padding on either side.
/// 
/// same as [Divider]
class MDivider extends Divider {
  MDivider({
    Key? key,
    double? indent,
    double? endIndent,
    double? height,
    double? thickness,
    Color? color = const Color(0xFFE5E5E5),
  }) : super(
          key: key,
          indent: indent,
          endIndent: endIndent,
          height: height,
          thickness: thickness,
          color: color,
        );
}

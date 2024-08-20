import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

class LmdDivider extends StatelessWidget {
  final double indent;
  const LmdDivider({this.indent = 8, super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: context.textColor.withOpacity(0.02),
        indent: indent,
      endIndent: indent,
    );
  }
}

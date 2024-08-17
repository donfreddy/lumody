import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

class LmdDividerBar extends StatelessWidget {
  final double width;
  final Color? color;

  const LmdDividerBar({
    this.width = 50,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color ?? context.textColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 4,
    );
  }
}

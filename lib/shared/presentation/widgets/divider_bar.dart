import 'package:flutter/material.dart';

class DividerBar extends StatelessWidget {
  final double width;
  final Color? color;

  const DividerBar({
    this.width = 50,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.black.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 4,
    );
  }
}

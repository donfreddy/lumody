import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

class LmdMaterial extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onLongPress;
  final BorderRadius? borderRadius;
  final Color? color;
  final double? elevation;

  const LmdMaterial({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.color,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? context.backgroundColor,
      borderRadius: borderRadius,
      elevation: elevation ?? 0,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: borderRadius,
        splashColor: context.textColor.withOpacity(0.04),
        hoverColor: context.textColor.withOpacity(0.04),
        focusColor: context.textColor.withOpacity(0.04),
        highlightColor: context.textColor.withOpacity(0.04),
        overlayColor: MaterialStateProperty.all(context.textColor.withOpacity(0.04)),
        child: child,
      ),
    );
  }
}

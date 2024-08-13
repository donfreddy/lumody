import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AnimatedFloatingButton extends StatelessWidget {
  final bool visible;
  final VoidCallback callback;
  final VoidCallback onLongPress;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  final String tooltip;
  final String heroTag;
  final double elevation;
  final ShapeBorder shape;
  final Curve curve;

  const AnimatedFloatingButton({
    super.key,
    this.visible = true,
    required this.callback,
    required this.child,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.tooltip,
    required this.heroTag,
    this.elevation = 6.0,
    this.shape = const CircleBorder(),
    this.curve = Curves.linear,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    var margin = visible ? 0.0 : 28.0;

    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: AnimatedContainer(
        curve: curve,
        margin: EdgeInsets.all(margin),
        duration: 150.milliseconds,
        width: visible ? 56.0 : 0.0,
        height: visible ? 56.0 : 0.0,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: FloatingActionButton(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            onPressed: callback,
            tooltip: tooltip,
            heroTag: heroTag,
            elevation: elevation,
            highlightElevation: elevation,
            shape: shape,
            child: visible ? child : null,
          ),
        ),
      ),
    );
  }
}

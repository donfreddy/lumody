import 'package:flutter/material.dart';

class BackgroundOverlay extends AnimatedWidget {
  final Color color;

  const BackgroundOverlay({
    super.key,
    required Animation<double> animation,
    this.color = Colors.black12,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return ColoredBox(
      color: color.withOpacity(animation.value * 0.2),
    );
  }
}

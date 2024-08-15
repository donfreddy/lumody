import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double indent;
  const AppDivider({this.indent = 8, super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: Colors.grey.shade100,
        indent: indent,
      endIndent: indent,
    );
  }
}

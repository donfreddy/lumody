import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

class LmdRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final bool readOnly;
  final String? label;
  final TextStyle? labelStyle;

  const LmdRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.readOnly = false,
    this.label,
    this.labelStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LmdMaterial(
      onTap: () => onChanged!(value),
      child: Padding(
        padding: 10.edgeInsetsV,
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            if (label != null) ...[
              width8,
              Text(
                label!,
                style: labelStyle ?? context.bodyMedium,
              )
            ]
          ],
        ),
      ),
    );
  }
}

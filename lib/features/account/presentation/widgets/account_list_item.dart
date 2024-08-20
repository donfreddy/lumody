import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumody/core/core.dart';

class AccountListItem extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? icon;
  final bool showIcon;
  final bool showSwitch;
  final bool showCheck;
  final bool showValue;
  final bool showArrow;
  final Color? iconColor;
  final Color? titleColor;
  final void Function()? onTap;

  const AccountListItem({
    required this.title,
    this.icon,
    this.value,
    this.showIcon = true,
    this.showSwitch = false,
    this.showCheck = false,
    this.showValue = false,
    this.showArrow = true,
    this.iconColor,
    this.titleColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LmdMaterial(
      color: context.cardColor,
      onTap: onTap,
      borderRadius: 8.borderRadiusA,
      child: Padding(
        padding: 8.edgeInsetsH + 12.edgeInsetsV,
        child: Row(
          children: [
            if (showIcon) ...[
              Icon(
                icon,
                size: 24,
                color: iconColor ?? context.iconTheme.color,
              ),
              width12,
            ],
            Text(
              title,
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                if (showValue) ...[
                  Text(
                    value!,
                    style: context.bodyMedium.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
                if (showArrow || showCheck) ...[
                  Icon(
                    showCheck ? Icons.check : Icons.arrow_forward_ios,
                    size: 20,
                    color: showCheck
                        ? context.primaryColor
                        : context.iconTheme.color,
                  ),
                ],
              ],
            ),
            if (showSwitch) ...[
              const Spacer(),
              Switch(
                value: true,
                onChanged: (value) {},
                activeColor: context.primaryColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

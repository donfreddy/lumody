import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

class AccountListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isLogout;
  final void Function()? onTap;

  const AccountListItem({
    required this.title,
    required this.icon,
    this.isLogout = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LmdMaterial(
      color: context.cardColor,
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: 8.edgeInsetsH + 16.edgeInsetsV,
        child: Row(
          children: [
            /* Image.asset(
              icon,
              width: 30,
              height: 30,
            ),*/
            Icon(
              icon,
              size: 24,
              color: isLogout ? Colors.red : Colors.grey[600],
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: context.bodyMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (!isLogout) ...[
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey[600],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
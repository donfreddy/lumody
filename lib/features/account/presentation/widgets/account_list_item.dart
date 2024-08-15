import 'package:flutter/material.dart';

class AccountListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isLogout;
  final Function? onTap;

  const AccountListItem({
    required this.title,
    required this.icon,
    this.isLogout = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap as void Function()?,
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.blue.withOpacity(0.1),
        hoverColor: Colors.blue.withOpacity(0.1),
        overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
        // splashColor: Colors.blue.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                style:  TextStyle(
                  fontSize: 16,
                  color: isLogout ? Colors.red : null,
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
      ),
    );
  }
}
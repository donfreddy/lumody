import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LmdMaterial(
      color: context.cardColor,
      onTap: () {},
      borderRadius: 8.borderRadiusA,
      child: Container(
        decoration: BoxDecoration(borderRadius: 8.borderRadiusA),
        child: Padding(
          padding: 8.edgeInsetsA,
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage:
                    const AssetImage('assets/images/profile_img.png'),
              ),
              width12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Freddy Tamwo',
                    style: context.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'freddytamwo@gmail.com',
                    style: context.bodyMedium.copyWith(
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: context.iconTheme.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

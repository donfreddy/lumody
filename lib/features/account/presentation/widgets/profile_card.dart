import 'package:flutter/material.dart';

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
        child:  Padding(
          padding: 8.edgeInsetsA,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile_img.png'),
              ),
              width12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Freddy Tamwo',
                    style: context.bodyMedium.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'freddytamwo@gmail.com',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

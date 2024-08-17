import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';
import 'package:lumody/core/shared/presentation/widgets/lmd_app_bar.dart';
import 'package:lumody/features/account/presentation/widgets/account_list_item.dart';
import 'package:lumody/core/shared/presentation/widgets/lmd_divider.dart';
import 'package:lumody/features/account/presentation/widgets/profile_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, 'Account'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: ProfileCard(),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      AccountListItem(
                        title: 'Achievements',
                        icon: Icons.school_rounded,
                        onTap: () {},
                      ),
                      const LmdDivider(),
                      AccountListItem(
                        title: 'Favorites',
                        icon: Icons.star_outline_rounded,
                        onTap: () {},
                      ),
                      const LmdDivider(),
                      AccountListItem(
                        title: 'Photo Gallery',
                        icon: Icons.photo_library,
                        onTap: () {},
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      AccountListItem(
                        title: 'Dayly Reminder',
                        icon: Icons.notifications_none_rounded,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Edit Moods & Colors',
                        icon: Icons.emoji_emotions_outlined,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Manage Activities',
                        icon: Icons.grid_view_outlined,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Export Data',
                        icon: Icons.exit_to_app_outlined,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Preferences',
                        icon: Icons.settings_outlined,
                        onTap: () {},
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      AccountListItem(
                        title: 'Account & Security',
                        icon: Icons.school_rounded,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Payment Methods',
                        icon: Icons.credit_card,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Billing & Subscriptions',
                        icon: Icons.reddit_rounded,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Linked Accounts',
                        icon: Icons.swap_vert_sharp,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'appearance'.tr(),
                        icon: Icons.remove_red_eye_outlined,
                        onTap: () {
                          Navigator.pushNamed(context, '/app-appearance');
                        },
                      ),
                      AccountListItem(
                        title: 'Help & Support',
                        icon: Icons.file_present_rounded,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Invite your friends',
                        icon: Icons.group,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Rate us',
                        icon: Icons.star_border_outlined,
                        onTap: () {},
                      ),
                      AccountListItem(
                        title: 'Logout',
                        icon: Icons.logout_outlined,
                        isLogout: true,
                        onTap: () {},
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'v1.0.0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

import '../../account.dart';

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
      appBar: LmdAppBar(
        title: UtilsHelper.trans('account.name'),
        showMoreBtn: true,
        showAppIcon: true,
        onMoreBtnPressed: () {},
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: 10.edgeInsetsV,
                child: const ProfileCard(),
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
              height10,
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
                      const LmdDivider(),
                      AccountListItem(
                        title: 'Edit Moods & Colors',
                        icon: Icons.emoji_emotions_outlined,
                        onTap: () {},
                      ),
                      const LmdDivider(),
                      AccountListItem(
                        title: 'Manage Activities',
                        icon: Icons.grid_view_outlined,
                        onTap: () {},
                      ),
                      const LmdDivider(),
                      AccountListItem(
                        title: 'Export Data',
                        icon: Icons.exit_to_app_outlined,
                        onTap: () {},
                      ),
                      const LmdDivider(),
                      AccountListItem(
                        title: 'Preferences',
                        icon: Icons.settings_outlined,
                        onTap: () {},
                      ),
                    ],
                  )),
              height10,
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
                    const LmdDivider(),
                    AccountListItem(
                      title: 'Payment Methods',
                      icon: Icons.credit_card,
                      onTap: () {},
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: 'Billing & Subscriptions',
                      icon: Icons.reddit_rounded,
                      onTap: () {},
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: 'Linked Accounts',
                      icon: Icons.swap_vert_sharp,
                      onTap: () {},
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: UtilsHelper.trans('account.appearance.name'),
                      icon: Icons.remove_red_eye_outlined,
                      onTap: () => context.pushNamed('/appearance'),
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: 'Help & Support',
                      icon: Icons.file_present_rounded,
                      onTap: () {},
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: 'Invite your friends',
                      icon: Icons.group,
                      onTap: () => UtilsHelper.shareApp(context),
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: 'Rate us',
                      icon: Icons.star_border_outlined,
                      onTap: () =>
                        UtilsHelper.rateApp(context),
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: UtilsHelper.trans('account.logout'),
                      icon: Icons.logout_outlined,
                      titleColor: Colors.red,
                      iconColor: Colors.red,
                      showArrow: false,
                      onTap: () => showLogoutModalBottomSheet(context),
                    ),
                  ],
                ),
              ),
              height10,
            ],
          ),
        ),
      ),
    );
  }
}

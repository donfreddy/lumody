import 'package:flutter/material.dart';
import 'package:lumody/features/account/presentation/widgets/profile_card.dart';
import 'package:lumody/shared/presentation/widgets/lumody_app_bar.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: lumodyAppBar(context, 'Account'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: ProfileCard(),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      AccountListItem(
                        title: 'Achievements',
                        icon: Icons.school_rounded,
                        onTap: () {},
                      ),

                      Divider(height: 0, color: Colors.grey.shade100,indent: 10,endIndent: 10),
                      AccountListItem(
                        title: 'Favorites',
                        icon: Icons.star_outline_rounded,
                        onTap: () {},
                      ),

                      Divider(height: 0, color: Colors.grey.shade100,indent: 10,endIndent: 10),
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                        title: 'App Appearance',
                        icon: Icons.remove_red_eye_outlined,
                        onTap: () {},
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
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'v1.0.0',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
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
                  fontWeight: FontWeight.bold,
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

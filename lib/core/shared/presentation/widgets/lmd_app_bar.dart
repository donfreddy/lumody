import 'package:flutter/material.dart';

class LmdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackBtnVisible;
  final bool showMoreBtn;
  final bool showAppIcon;
  final Function()? onMoreBtnPressed;

  const LmdAppBar({
    required this.title,
    this.isBackBtnVisible = true,
    this.showMoreBtn = false,
    this.showAppIcon = false,
    this.onMoreBtnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showAppIcon
          ? IconButton(
              icon: const Icon(Icons.person_pin),
              onPressed: () {},
            )
          : null,
      automaticallyImplyLeading: isBackBtnVisible,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: showMoreBtn
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: onMoreBtnPressed,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

AppBar mainAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.person_pin),
      onPressed: () {},
    ),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 6),
        child: IconButton(
          icon: const Icon(Icons.more_vert_rounded),
          onPressed: () {},
        ),
      ),
    ],
  );
}

AppBar simpleAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

import 'package:flutter/material.dart';

AppBar lumodyAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.person_pin),
      onPressed: () {},
    ),
    centerTitle: true,
    title: Text(title,  style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),),
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

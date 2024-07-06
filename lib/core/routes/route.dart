import 'package:flutter/material.dart';
import 'package:lumody/core/routes/route_name.dart';
import 'package:lumody/main.dart';

Route generateRoute(RouteSettings settings) {
  Object? args = settings.arguments;

  switch (settings.name) {
    case RouteName.initial:
      return MaterialPageRoute(builder: (_) => const MyHomePage(title: ''));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

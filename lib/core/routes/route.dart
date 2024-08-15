import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumody/core/routes/route_name.dart';
import 'package:lumody/features/account/presentation/screens/app_appearance/app_appearance_screen.dart';
import 'package:lumody/features/account/presentation/screens/app_appearance/app_language_screen.dart';
import 'package:lumody/features/home/presentation/screens/main_screen.dart';
import 'package:lumody/main.dart';

Route generateRoute(RouteSettings settings) {
  Object? args = settings.arguments;

  switch (settings.name) {
    case RouteName.initial:
      return MaterialPageRoute(builder: (_) => const MyHomePage(title: ''));
    case RouteName.main:
      return MaterialPageRoute(builder: (_) => const MainScreen());
    case RouteName.appAppearance:
      return CupertinoPageRoute(builder: (_) => const AppAppearanceScreen());
    case RouteName.appLanguage:
      return CupertinoPageRoute(builder: (_) => const AppLanguageScreen());
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

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // If it's the initial route, don't animate
    if (isFirst) return child;

    const begin = Offset(1.0, 0.0); // Slide in from the right
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var slideTween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: SlideTransition(
        position: animation.drive(slideTween),
        child: child,
      ),
    );
  }
}

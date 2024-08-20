import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumody/core/core.dart';
import 'package:supercharged/supercharged.dart';
import 'package:toastification/toastification.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  NavigatorState get navigator => Navigator.of(this);

  void showSnackBar(Widget snackBar) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        padding: const EdgeInsets.only(top: 20),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: snackBar,
      ),
    );
  }

  void showMessage(String message) {
    toastification.show(
      context: this,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      //backgroundColor: backgroundColor,
      title: Text(
        message,
        style: bodyMedium.copyWith(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
      borderSide: BorderSide.none,
      borderRadius: 8.borderRadiusA,
      padding: 8.edgeInsetsA,
      animationDuration: 300.milliseconds,
      autoCloseDuration: 5.seconds,
      alignment: Alignment.bottomCenter,
      showProgressBar: false,
      showIcon: false,
      closeButtonShowType: CloseButtonShowType.none,
    );
  }
}

extension ContextNavigatorExt on BuildContext {
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigator.pushNamed(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      navigator.pushNamedAndRemoveUntil(
        newRouteName,
        predicate,
        arguments: arguments,
      );

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      navigator.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  void pop<T extends Object?>([T? result]) => navigator.pop(result);

  void popUntil(RoutePredicate predicate) => navigator.popUntil(predicate);
}

extension ContextThemeColors on BuildContext {
  Color get textColor => Theme.of(this).textTheme.bodyLarge!.color!;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get accentColor => Theme.of(this).colorScheme.secondary;

  Color get hintColor => Theme.of(this).hintColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get cardColor => Theme.of(this).cardColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
}

extension ContextTextStylesX on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
}

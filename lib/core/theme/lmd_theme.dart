import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumody/core/core.dart';

abstract class LmdTheme {
  static ThemeData themeData(BuildContext context, {bool isDark = false}) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: LmdColors.primaryColorMaterial,
      primaryColor: LmdColors.primaryColor,
      colorScheme: ColorScheme(
        primary: LmdColors.primaryColor,
        secondary: LmdColors.primaryColor,
        tertiary: isDark ? Colors.white.withOpacity(.02) : Colors.grey,
        surface: isDark ? LmdColors.darkBgColor : LmdColors.lightBgColor,
        background: isDark ? LmdColors.darkBgColor : LmdColors.lightBgColor,
        error: Colors.red,
        onPrimary: Colors.grey,
        onSecondary: Colors.grey,
        onSurface: isDark ? LmdColors.darkTextColor : LmdColors.lightTextColor,
        onBackground:
            isDark ? LmdColors.darkTextColor : LmdColors.lightTextColor,
        onError: Colors.white,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      textTheme: isDark
          ? _textTheme(ThemeData.dark().textTheme, LmdColors.darkTextColor)
          : _textTheme(ThemeData.light().textTheme, LmdColors.lightTextColor),
      iconTheme: const IconThemeData(color: Colors.grey),
      cardColor: isDark ? LmdColors.cardColor : Colors.white,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        scrimColor: Colors.transparent,
      ),
    );
  }

  static TextTheme _textTheme(TextTheme base, Color color) {
    return base
        .copyWith(
          displayLarge: base.displayLarge!.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 96.sp,
          ),
          displayMedium: base.displayMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 60.sp,
          ),
          displaySmall: base.displaySmall!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 48.sp,
          ),
          headlineLarge: base.headlineLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 34.sp,
          ),
          headlineMedium: base.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
          headlineSmall: base.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
          titleLarge: base.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
          titleMedium: base.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
          bodyLarge: base.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
          bodyMedium: base.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          bodySmall: base.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
          labelLarge: base.labelLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          labelMedium: base.labelSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
          ),
          labelSmall: base.labelSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        )
        .apply(
          fontFamily: 'Poppins',
          bodyColor: color,
          displayColor: color,
        );
  }
}

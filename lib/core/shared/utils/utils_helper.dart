import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumody/core/core.dart';
import 'package:supercharged/supercharged.dart';
import 'package:toastification/toastification.dart';

class UtilsHelper {
  UtilsHelper._();

  static String trans(String? key, {Map<String, String>? args}) {
    var result = '';
    try {
      if (key != '' && key != null) {
        result = tr(key, namedArgs: args);
      } else {
        result = '';
      }
    } catch (e) {
      //
    }
    return result;
  }

  static String getString(
    BuildContext context,
    String key, {
    Map<String, String>? args,
  }) {
    return trans(key, args: args);
  }

  static String get2LettersFromName(String name) {
    final names = name.split(' ');
    if (names.length == 1) {
      return names[0].substring(0, 2).toUpperCase();
    }
    return '${names[0][0]}${names[1][0]}'.toUpperCase();
  }

  static String getCurrentLang(BuildContext context) {
    const baseTransKey = 'account.appearance.lang';
    switch (context.locale.languageCode) {
      case 'en':
        return UtilsHelper.trans('$baseTransKey.english');
      case 'fr':
        return UtilsHelper.trans('$baseTransKey.french');
      default:
        return UtilsHelper.trans('$baseTransKey.english');
    }
  }

  static void shareApp(BuildContext context) {
   context.showMessage('Thank you for sharing Lumody! You are helping us to grow and improve.');
  }

  static rateApp(BuildContext context) {
    context.showMessage('Thank you for rating Lumody! You are helping us to grow and improve.');
  }
}

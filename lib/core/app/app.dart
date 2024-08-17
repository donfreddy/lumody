import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumody/core/routes/route.dart';
import 'package:lumody/core/routes/route_name.dart';

import '../core.dart';

class LumodyApp extends StatelessWidget {
  const LumodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LmdThemeCubit()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: kAppName,
            theme: LmdTheme.themeData(context),
            darkTheme: LmdTheme.themeData(context, isDark: true),
            themeMode: context.watch<LmdThemeCubit>().themeMode,
            initialRoute: RouteName.main,
            onGenerateRoute: generateRoute,
          );
        }
      ),
    );
  }
}

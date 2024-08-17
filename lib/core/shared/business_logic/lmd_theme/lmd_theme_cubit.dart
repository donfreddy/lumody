import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lumody/core/shared/utils/app_storage.dart';

// ignore: constant_identifier_names
const String THEME_STATUS = 'theme_status';

class LmdThemeCubit extends Cubit<ThemeMode> {
  LmdThemeCubit() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  ThemeMode get themeMode {
    return state;
  }

  void _loadThemeMode() {
    final savedMode = AppStorage.get<String>(THEME_STATUS);
    if (savedMode != null) {
      emit(
        ThemeMode.values.firstWhere(
          (e) => e.name == savedMode,
          orElse: () => ThemeMode.system,
        ),
      );
    }
  }

  void setThemeMode(ThemeMode mode) {
    AppStorage.save(THEME_STATUS, mode.name);
    emit(mode);
  }
}

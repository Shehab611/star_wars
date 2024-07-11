import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/service_locator.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void changeLocale() {
    var appLang = sl<AppLanguage>();
    if (appLang.appLocal == const Locale('en')) {
      appLang.changeLanguage(const Locale('ar'));
    } else {
      appLang.changeLanguage(const Locale('en'));
    }
  }

  void changeTheme() {
    var appTheme = sl<AppTheme>();
    if (appTheme.themeMode == ThemeMode.system) {
      var brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      if (isDarkMode) {
        appTheme.changeTheme(ThemeMode.light);
      } else {
        appTheme.changeTheme(ThemeMode.dark);
      }
    } else if (appTheme.themeMode == ThemeMode.light) {
      appTheme.changeTheme(ThemeMode.dark);
    } else {
      appTheme.changeTheme(ThemeMode.light);
    }
  }
}

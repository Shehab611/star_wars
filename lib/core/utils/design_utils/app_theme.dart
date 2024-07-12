import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_colors.dart';
part 'app_sizes.dart';
part 'app_text_styles.dart';

abstract final class AppThemeData {
  static AppBarTheme appBarTheme = const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      actionsIconTheme: IconThemeData(applyTextScaling: true, size: 20),
      titleTextStyle: AppTextStyles.appBarTextStyle);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.cardColor, shadow: Colors.black.withOpacity(.5)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme.copyWith(
        color: Colors.white,
        titleTextStyle: appBarTheme.titleTextStyle
            ?.copyWith(color: AppColors.primaryColor)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.primaryColor,
      ),
      bodyMedium: TextStyle(
        color: AppColors.primaryColor,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryColor,
      ),
      titleSmall: TextStyle(
        color: AppColors.primaryColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      iconTheme: const IconThemeData(color: Colors.yellowAccent),
      brightness: Brightness.dark,
      shadowColor: Colors.white.withOpacity(.5),
      appBarTheme: appBarTheme);
}

final class AppTheme extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  ThemeMode get themeMode => _themeMode;

  Future<void> fetchTheme() async {
    var prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('theme_mode');
    if (themeString == null) {
      _themeMode = ThemeMode.system; // Default if no preference is stored
      await prefs.setString('theme_mode', 'system');
    } else {
      _themeMode = _getThemeModeFromString(themeString);
    }
  }

  void changeTheme(ThemeMode themeMode) async {
    var prefs = await SharedPreferences.getInstance();
    if (_themeMode == themeMode) {
      return; // No change needed
    } else {
      _themeMode = themeMode;
      await prefs.setString('theme_mode', _themeModeToString(themeMode));
    }
    notifyListeners();
  }

  // Helper methods for converting between ThemeMode and String
  ThemeMode _getThemeModeFromString(String themeString) {
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}

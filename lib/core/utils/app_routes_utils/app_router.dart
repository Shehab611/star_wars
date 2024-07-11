import 'package:flutter/material.dart';
import 'package:star_wars/features/home/presentation/views/home_screen.dart';

part 'app_navigator.dart';
part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kHomeScreen: (BuildContext context) => const HomeScreen()
  };
}

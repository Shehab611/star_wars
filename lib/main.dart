import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/service_locator.dart';
import 'core/utils/app_constants/app_strings.dart';
import 'core/utils/app_routes_utils/app_router.dart';
import 'core/utils/design_utils/app_theme.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<AppLanguage>().fetchLocale();
  await sl<AppTheme>().fetchTheme();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppLanguage appLanguage = sl<AppLanguage>();
  static final AppTheme appTheme = sl<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: appTheme,
        builder: (context, snapshot) {
          return ListenableBuilder(
            listenable: appLanguage,
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.15),
                  ),
                  child: MaterialApp(
                    title: 'Star Wars',
                    debugShowCheckedModeBanner: false,
                    routes: AppRouter.routes,
                    theme: AppThemeData.lightTheme,
                    darkTheme: AppThemeData.darkTheme,
                    themeMode: appTheme.themeMode,
                    initialRoute: AppPathName.kNewsScreen,
                    locale: appLanguage.appLocal,
                    supportedLocales: AppConstants.supportedLocales.values,
                    localizationsDelegates: AppConstants.delegates,
                  ));
            },
          );
        });
  }
}

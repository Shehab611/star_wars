part of 'app_router.dart';

abstract final class AppNavigator {
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kHomeScreen);
  }

  static void navigateToSeeMoreScreen<T>(
      BuildContext context, List<T> data, String screenName) {
    Navigator.pushNamed(context, AppPathName.kSeeMoreScreen,
        arguments: {'data': data, 'screen_name': screenName});
  }
}

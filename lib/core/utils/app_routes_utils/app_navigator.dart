part of 'app_router.dart';

abstract final class AppNavigator {
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kHomeScreen);
  }
}

part of 'app_router.dart';

abstract final class AppNavigator {
  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kHomeScreen);
  }
}

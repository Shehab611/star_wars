abstract final class HelperMethods {
  static String extractID(String url) {
    return url.split('/').lastWhere(
          (element) => element.isNotEmpty,
        );
  }
}

abstract final class HelperMethods {
  static String extractID(String? url) {
    if (url != null) {
      return url.split('/').lastWhere(
            (element) => element.isNotEmpty,
          );
    }
    return 'n/a';
  }
}

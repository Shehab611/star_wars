abstract final class HelperMethods {
  static String extractID(String? url) {
    if (url != null && url != 'n/a') {
      return url.split('/').lastWhere(
            (element) => element.isNotEmpty,
          );
    }
    return 'n/a';
  }

  static bool canLoadMore(String? url) {
    return url != null;
  }
}

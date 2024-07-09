part of '../../usable_functions/api_service_helper.dart';

abstract final class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = AppStrings.requestCancelled;
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = AppStrings.connectionTimeOut;
              break;
            case DioExceptionType.connectionError:
              errorDescription = AppStrings.internetConnectionError;
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = AppStrings.receiveTimeOut;
              break;
            case DioExceptionType.badResponse:
              if (error.response!.statusCode! < 500 &&
                  error.response!.statusCode! > 399) {
                errorDescription = ErrorResponse.fromJson(error.response!.data);
              } else {
                errorDescription = error.response!.data;
              }
            case DioExceptionType.sendTimeout:
              errorDescription = AppStrings.sendTimeOut;
            case DioExceptionType.badCertificate:
              errorDescription = AppStrings.badCertificatesError;
            case DioExceptionType.unknown:
              errorDescription = AppStrings.unknownError;
          }
        } else {
          errorDescription = AppStrings.unexpectedError;
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}

abstract final class ApiChecker {
  static String checkApi(dynamic error) {
    if (error is String) {
      return error;
    } else {
      ErrorResponse errorResponse = error;
      return errorResponse.message;
    }
  }
}

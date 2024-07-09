part of '../../usable_functions/api_service_helper.dart';

final class ApiResponseHandler {
  final DioClient _dioClient;

  const ApiResponseHandler(this._dioClient);

  Future<ApiResponse> handleGetApiResponse(String endPoint,
      [Map<String, dynamic>? query]) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      final response =
          await _dioClient.get(endPoint, stackTrace, queryParameters: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
          ApiChecker.checkApi(ApiErrorHandler.getMessage(e)));
    }
  }
}

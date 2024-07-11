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

  List<T> extractListData<T>(
      ApiResponse apiResponse, T Function(Map<String, dynamic> json) fromJson,
      [String dataKey = 'results']) {
    final List<T> data = [];
    final responseData = apiResponse.response?.data;
    final dataList = responseData[dataKey];
    for (var json in dataList) {
      data.add(fromJson(json));
    }

    return data;
  }

  T extractData<T>(
      ApiResponse apiResponse, T Function(Map<String, dynamic> json) fromJson,
      [String dataKey = 'results']) {
    final responseData = apiResponse.response?.data;
    final data = responseData[dataKey];
    return fromJson(data);
  }
}

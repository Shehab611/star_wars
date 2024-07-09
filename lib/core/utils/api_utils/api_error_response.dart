part of '../../usable_functions/api_service_helper.dart';

class ErrorResponse {
  final String message;

  const ErrorResponse(this.message);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(json['detail']);
  }
}

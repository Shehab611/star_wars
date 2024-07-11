part of 'remote_data_source_interfaces.dart';

final class VehicleRemoteDataSourceImpl
    implements VehicleRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const VehicleRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<List<VehicleModel>> getVehicleData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.people, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return _apiResponseHandler.extractListData<VehicleModel>(
          apiResponse, VehicleModel.fromJson);
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

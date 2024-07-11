part of 'remote_data_source_interfaces.dart';

final class VehicleRemoteDataSourceImpl
    implements VehicleRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const VehicleRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<BaseModel<List<VehicleModel>>> getVehicleData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.vehicles, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return BaseModel<List<VehicleModel>>(
          canLoadMore:
              HelperMethods.canLoadMore(apiResponse.response!.data['next']),
          data: _apiResponseHandler.extractListData<VehicleModel>(
              apiResponse, VehicleModel.fromJson));
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

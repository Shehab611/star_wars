part of 'remote_data_source_interfaces.dart';

final class PlanetRemoteDataSourceImpl
    implements PlanetRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const PlanetRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<BaseModel<List<PlanetModel>>> getPlanetData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.planets, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return BaseModel<List<PlanetModel>>(
          canLoadMore:
              HelperMethods.canLoadMore(apiResponse.response!.data['next']),
          data: _apiResponseHandler.extractListData<PlanetModel>(
              apiResponse, PlanetModel.fromJson));
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

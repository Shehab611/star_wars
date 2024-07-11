part of 'remote_data_source_interfaces.dart';

final class StarshipRemoteDataSourceImpl
    implements StarshipRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const StarshipRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<BaseModel<List<StarshipModel>>> getStarshipData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.starships, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return BaseModel<List<StarshipModel>>(
          canLoadMore:
              HelperMethods.canLoadMore(apiResponse.response!.data['next']),
          data: _apiResponseHandler.extractListData<StarshipModel>(
              apiResponse, StarshipModel.fromJson));
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

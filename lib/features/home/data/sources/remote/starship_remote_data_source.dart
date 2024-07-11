part of 'remote_data_source_interfaces.dart';

final class StarshipRemoteDataSourceImpl
    implements StarshipRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const StarshipRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<List<StarshipModel>> getStarshipData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.people, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return _apiResponseHandler.extractListData<StarshipModel>(
          apiResponse, StarshipModel.fromJson);
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

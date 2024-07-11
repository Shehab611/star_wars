part of 'remote_data_source_interfaces.dart';

final class SpeciesRemoteDataSourceImpl
    implements SpeciesRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const SpeciesRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<List<SpeciesModel>> getSpeciesData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.people, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return _apiResponseHandler.extractListData<SpeciesModel>(
          apiResponse, SpeciesModel.fromJson);
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

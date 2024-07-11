part of 'remote_data_source_interfaces.dart';

final class SpeciesRemoteDataSourceImpl
    implements SpeciesRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const SpeciesRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<BaseModel<List<SpeciesModel>>> getSpeciesData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.species, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return BaseModel<List<SpeciesModel>>(
          canLoadMore:
              HelperMethods.canLoadMore(apiResponse.response!.data['next']),
          data: _apiResponseHandler.extractListData<SpeciesModel>(
              apiResponse, SpeciesModel.fromJson));
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

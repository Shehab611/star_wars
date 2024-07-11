part of 'remote_data_source_interfaces.dart';

final class PeopleRemoteDataSourceImpl
    implements PeopleRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const PeopleRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<BaseModel<List<PeopleModel>>> getPeopleData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.people, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return BaseModel<List<PeopleModel>>(
          canLoadMore:
              HelperMethods.canLoadMore(apiResponse.response!.data['next']),
          data: _apiResponseHandler.extractListData<PeopleModel>(
              apiResponse, PeopleModel.fromJson));
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

part of 'remote_data_source_interfaces.dart';

final class FilmRemoteDataSourceImpl implements FilmRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const FilmRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<BaseModel<List<FilmModel>>> getFilmData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.films, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return BaseModel<List<FilmModel>>(
          canLoadMore:
              HelperMethods.canLoadMore(apiResponse.response!.data['next']),
          data: _apiResponseHandler.extractListData<FilmModel>(
              apiResponse, FilmModel.fromJson));
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

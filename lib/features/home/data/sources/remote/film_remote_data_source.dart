part of 'remote_data_source_interfaces.dart';

final class FilmRemoteDataSourceImpl implements FilmRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const FilmRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<List<FilmModel>> getFilmData(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler
        .handleGetApiResponse(ApiEndPoints.films, {'page': pageNum});
    if (apiResponse.statusCode == 200) {
      return _apiResponseHandler.extractListData<FilmModel>(
          apiResponse, FilmModel.fromJson);
    } else {
      throw Exception(apiResponse.error);
    }
  }
}

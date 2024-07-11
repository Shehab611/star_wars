import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/film_interface.dart';

final class FilmRepositoryImpl implements FilmInterface {
  final FilmRemoteDataSourceInterface _dataSource;

  const FilmRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<List<Film>>> getFilmData(int pageNum) async {
    try {
      final data = await _dataSource.getFilmData(pageNum);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}

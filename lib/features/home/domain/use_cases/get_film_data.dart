import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/domain/repositories/film_interface.dart';

final class GetFilmData implements BaseUseCaseInterface<List<Film>, int> {
  final FilmInterface _interface;

  const GetFilmData(this._interface);

  @override
  Future<DataResponse<List<Film>>> call([int pageNum = 1]) async {
    return await _interface.getFilmData(pageNum);
  }
}

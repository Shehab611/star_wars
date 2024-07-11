import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';

abstract interface class FilmInterface {
  Future<DataResponse<BaseModel<List<Film>>>> getFilmData(int pageNum);
}

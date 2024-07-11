import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';

abstract interface class StarshipInterface {
  Future<DataResponse<BaseModel<List<Starship>>>> getStarshipData(int pageNum);
}

import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';

abstract interface class PlanetInterface {
  Future<DataResponse<List<Planet>>> getPlanetData(int pageNum);
}

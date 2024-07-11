import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';

abstract interface class SpeciesInterface {
  Future<DataResponse<List<Species>>> getSpeciesData(int pageNum);
}

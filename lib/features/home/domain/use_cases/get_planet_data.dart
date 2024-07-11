import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/domain/repositories/planet_interface.dart';

final class GetPlanetData implements BaseUseCaseInterface<List<Planet>, int> {
  final PlanetInterface _interface;

  const GetPlanetData(this._interface);

  @override
  Future<DataResponse<List<Planet>>> call([int pageNum = 1]) async {
    return await _interface.getPlanetData(pageNum);
  }
}

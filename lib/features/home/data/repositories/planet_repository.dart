import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/planet_interface.dart';

final class PlanetRepositoryImpl implements PlanetInterface {
  final PlanetRemoteDataSourceInterface _dataSource;

  const PlanetRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<List<Planet>>> getPlanetData(int pageNum) async {
    try {
      final data = await _dataSource.getPlanetData(pageNum);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}

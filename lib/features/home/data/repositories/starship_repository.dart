import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/starship_interface.dart';

final class StarshipRepositoryImpl implements StarshipInterface {
  final StarshipRemoteDataSourceInterface _dataSource;

  const StarshipRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<List<Starship>>> getStarshipData(int pageNum) async {
    try {
      final data = await _dataSource.getStarshipData(pageNum);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}

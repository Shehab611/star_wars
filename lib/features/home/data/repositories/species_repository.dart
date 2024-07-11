import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/species_interface.dart';

final class SpeciesRepositoryImpl implements SpeciesInterface {
  final SpeciesRemoteDataSourceInterface _dataSource;

  const SpeciesRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<BaseModel<List<Species>>>> getSpeciesData(
      int pageNum) async {
    try {
      final data = await _dataSource.getSpeciesData(pageNum);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}

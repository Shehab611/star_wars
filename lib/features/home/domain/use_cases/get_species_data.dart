import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/domain/repositories/species_interface.dart';

final class GetSpeciesData
    implements BaseUseCaseInterface<BaseModel<List<Species>>, int> {
  final SpeciesInterface _interface;

  const GetSpeciesData(this._interface);

  @override
  Future<DataResponse<BaseModel<List<Species>>>> call([int pageNum = 1]) async {
    return await _interface.getSpeciesData(pageNum);
  }
}

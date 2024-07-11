import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/domain/repositories/starship_interface.dart';

final class GetStarshipData
    implements BaseUseCaseInterface<BaseModel<List<Starship>>, int> {
  final StarshipInterface _interface;

  const GetStarshipData(this._interface);

  @override
  Future<DataResponse<BaseModel<List<Starship>>>> call(
      [int pageNum = 1]) async {
    return await _interface.getStarshipData(pageNum);
  }
}

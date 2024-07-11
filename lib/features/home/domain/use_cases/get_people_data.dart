import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/domain/repositories/people_interface.dart';

final class GetPeopleData implements BaseUseCaseInterface<List<People>, int> {
  final PeopleInterface _interface;

  const GetPeopleData(this._interface);

  @override
  Future<DataResponse<List<People>>> call([int pageNum = 1]) async {
    return await _interface.getPeopleData(pageNum);
  }
}

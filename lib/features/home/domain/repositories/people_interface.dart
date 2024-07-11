import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';

abstract interface class PeopleInterface {
  Future<DataResponse<BaseModel<List<People>>>> getPeopleData(int pageNum);
}

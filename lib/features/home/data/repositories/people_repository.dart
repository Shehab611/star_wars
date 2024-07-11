import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/people_interface.dart';

final class PeopleRepositoryImpl implements PeopleInterface {
  final PeopleRemoteDataSourceInterface _dataSource;

  const PeopleRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<BaseModel<List<People>>>> getPeopleData(
      int pageNum) async {
    try {
      final data = await _dataSource.getPeopleData(pageNum);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}

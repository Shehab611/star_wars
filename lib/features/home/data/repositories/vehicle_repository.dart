import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/vehicle_interface.dart';

final class VehicleRepositoryImpl implements VehicleInterface {
  final VehicleRemoteDataSourceInterface _dataSource;

  const VehicleRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<BaseModel<List<Vehicle>>>> getVehicleData(
      int pageNum) async {
    try {
      final data = await _dataSource.getVehicleData(pageNum);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}

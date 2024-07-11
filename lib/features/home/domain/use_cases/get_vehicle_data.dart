import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';
import 'package:star_wars/features/home/domain/repositories/vehicle_interface.dart';

final class GetVehicleData
    implements BaseUseCaseInterface<BaseModel<List<Vehicle>>, int> {
  final VehicleInterface _interface;

  const GetVehicleData(this._interface);

  @override
  Future<DataResponse<BaseModel<List<Vehicle>>>> call([int pageNum = 1]) async {
    return await _interface.getVehicleData(pageNum);
  }
}

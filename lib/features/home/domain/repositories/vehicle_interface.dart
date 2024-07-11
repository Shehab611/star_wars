import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/utils/api_utils/data_response.dart';

abstract interface class VehicleInterface {
  Future<DataResponse<List<Vehicle>>> getVehicleData(int pageNum);
}

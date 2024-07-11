import 'package:star_wars/core/shared/data_entities/vehicle.dart';

import 'data_provider.dart';

class VehicleDataProvider implements DataProvider {
  final Vehicle vehicle;

  const VehicleDataProvider(this.vehicle);

  @override
  String get lowerData => vehicle.vehicleClass;

  @override
  String get upperData => vehicle.name;
}

import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class VehicleModel extends Vehicle {
  const VehicleModel({
    required super.id,
    required super.name,
    required super.model,
    required super.manufacturer,
    required super.costInCredits,
    required super.maxAtmospheringSpeed,
    required super.crew,
    required super.passengers,
    required super.length,
    required super.cargoCapacity,
    required super.films,
    required super.pilots,
    required super.consumables,
    required super.vehicleClass,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
        id: HelperMethods.extractID(json['url']),
        name: json['name'],
        model: json['model'],
        manufacturer: json['manufacturer'],
        costInCredits: json['cost_in_credits'],
        maxAtmospheringSpeed: json['max_atmosphering_speed'],
        crew: json['crew'],
        passengers: json['passengers'],
        length: json['length'],
        cargoCapacity: json['cargo_capacity'],
        films: (json['films'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>(),
        pilots: (json['pilots'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>(),
        consumables: json['consumables'],
        vehicleClass: json['vehicle_class']);
  }
}

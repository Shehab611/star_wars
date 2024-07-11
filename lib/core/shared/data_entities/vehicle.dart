import 'package:equatable/equatable.dart';

abstract class Vehicle extends Equatable {
  final String id;
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String length;
  final String cargoCapacity;
  final String consumables;
  final String vehicleClass;
  final List<String> films;
  final List<String> pilots;

  const Vehicle({
    required this.id,
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.length,
    required this.cargoCapacity,
    required this.films,
    required this.pilots,
    required this.consumables,
    required this.vehicleClass,
  });

  @override
  List<Object> get props => [
        id,
        name,
        model,
        manufacturer,
        costInCredits,
        maxAtmospheringSpeed,
        crew,
        passengers,
        length,
        cargoCapacity,
        consumables,
        vehicleClass,
        films,
        pilots,
      ];
}

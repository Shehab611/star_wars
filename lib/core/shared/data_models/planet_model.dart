import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class PlantModel extends Plant {
  const PlantModel(
      {required super.id,
      required super.name,
      required super.rotationPeriod,
      required super.orbitalPeriod,
      required super.diameter,
      required super.climate,
      required super.gravity,
      required super.terrain,
      required super.population,
      required super.surfaceWater,
      required super.films,
      required super.residents});

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        id: HelperMethods.extractID(json['url']),
        name: json['name'],
        rotationPeriod: json['rotation_period'],
        orbitalPeriod: json['orbital_period'],
        diameter: json['diameter'],
        climate: json['climate'],
        gravity: json['gravity'],
        terrain: json['terrain'],
        population: json['population'],
        surfaceWater: json['surface_water'],
        films: (json['films'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        residents: (json['residents'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList());
  }

}
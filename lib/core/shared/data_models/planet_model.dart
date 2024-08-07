import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class PlanetModel extends Planet {
  const PlanetModel(
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

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
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
        films: (json['films'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>(),
        residents: (json['residents'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>());
  }
}

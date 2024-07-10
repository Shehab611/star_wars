import 'package:equatable/equatable.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class PlantsModel extends Equatable {
  final String id;
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String population;
  final String surfaceWater;
  final List<String> films;
  final List<String> residents;

  const PlantsModel(
      {required this.id,
        required this.name,
        required this.rotationPeriod,
        required this.orbitalPeriod,
        required this.diameter,
        required this.climate,
        required this.gravity,
        required this.terrain,
        required this.population,
        required this.surfaceWater,
        required this.films,
        required this.residents});

  factory PlantsModel.fromJson(Map<String, dynamic> json) {
    return PlantsModel(
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

  @override
  List<Object> get props => [
    id,
    name,
    rotationPeriod,
    orbitalPeriod,
    diameter,
    climate,
    gravity,
    terrain,
    population,
    surfaceWater,
    films,
    residents,
  ];
}
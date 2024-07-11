import 'package:equatable/equatable.dart';

abstract class Planet extends Equatable {
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

  const Planet(
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

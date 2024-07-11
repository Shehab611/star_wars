import 'package:equatable/equatable.dart';

abstract class Starship extends Equatable {
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
  final String hyperDriveRating;
  final String consumables;
  final String mglt;
  final String starshipClass;
  final List<String> films;
  final List<String> pilots;
  final bool canLoadMore;

  const Starship(
      {required this.id,
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
      required this.hyperDriveRating,
      required this.starshipClass,
      required this.mglt,
      required this.canLoadMore});

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
        hyperDriveRating,
        consumables,
        mglt,
        starshipClass,
        films,
        pilots,
        canLoadMore,
      ];
}

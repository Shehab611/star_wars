import 'package:equatable/equatable.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class StarshipsModel extends Equatable {
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

  const StarshipsModel(
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
      required this.mglt});

  factory StarshipsModel.fromJson(Map<String, dynamic> json) {
    return StarshipsModel(
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
        films: (json['films'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        pilots: (json['pilots'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        consumables: json['consumables'],
        hyperDriveRating: json['hyperdrive_rating'],
        mglt: json['MGLT'],
        starshipClass: json['starship_class']);
  }

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
        films,
        pilots,
      ];
}

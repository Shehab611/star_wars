import 'package:equatable/equatable.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class PeopleModel extends Equatable {
  final String id;
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeWorld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;

  const PeopleModel(
      {required this.id,
      required this.name,
      required this.height,
      required this.mass,
      required this.hairColor,
      required this.skinColor,
      required this.eyeColor,
      required this.birthYear,
      required this.gender,
      required this.homeWorld,
      required this.films,
      required this.species,
      required this.vehicles,
      required this.starships});

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
        id: HelperMethods.extractID(json['url']),
        name: json['name'],
        height: json['height'],
        mass: json['mass'],
        hairColor: json['hair_color'],
        skinColor: json['skin_color'],
        eyeColor: json['eye_color'],
        birthYear: json['birth_year'],
        gender: json['gender'],
        homeWorld: HelperMethods.extractID(json['homeworld']),
        films: (json['films'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        species: (json['species'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        vehicles: (json['vehicles'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        starships: (json['starships'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList());
  }

  @override
  List<Object> get props => [
        id,
        name,
        height,
        mass,
        hairColor,
        skinColor,
        eyeColor,
        birthYear,
        gender,
        homeWorld,
        films,
        species,
        vehicles,
        starships,
      ];
}

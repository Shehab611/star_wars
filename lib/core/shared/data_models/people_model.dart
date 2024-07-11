import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class PeopleModel extends People {
  const PeopleModel({required super.id,
    required super.name,
    required super.height,
    required super.mass,
    required super.hairColor,
    required super.skinColor,
    required super.eyeColor,
    required super.birthYear,
    required super.gender,
    required super.homeWorld,
    required super.films,
    required super.species,
    required super.vehicles,
    required super.starships});

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
}

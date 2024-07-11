import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class SpeciesModel extends Species {
  const SpeciesModel({
    required super.id,
    required super.name,
    required super.classification,
    required super.designation,
    required super.hairColors,
    required super.skinColor,
    required super.eyeColor,
    required super.averageHeight,
    required super.averageLifespan,
    required super.homeWorld,
    required super.films,
    required super.language,
    required super.people,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      id: HelperMethods.extractID(json['url']),
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      hairColors: json['hair_colors'] == 'n/a'
          ? [json['hair_colors']]
          : json['hair_colors'].split(', '),
      skinColor: json['skin_colors'] == 'n/a'
          ? [json['skin_colors']]
          : json['skin_colors'].split(', '),
      eyeColor: json['eye_colors'] == 'n/a'
          ? [json['eye_colors']]
          : json['eye_colors'].split(', '),
      averageHeight: json['average_height'],
      averageLifespan: json['average_lifespan'],
      language: json['language'],
      homeWorld: HelperMethods.extractID(json['homeworld']),
      films: (json['films'])
          .map((e) => HelperMethods.extractID(e))
          .toList()
          .cast<String>(),
      people: (json['people'])
          .map((e) => HelperMethods.extractID(e))
          .toList()
          .cast<String>(),
    );
  }
}

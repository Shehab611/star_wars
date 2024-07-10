import 'package:equatable/equatable.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class SpeciesModel extends Equatable {
  final String id;
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final List<String> hairColors;
  final List<String> skinColor;
  final List<String> eyeColor;
  final String averageLifespan;
  final String homeWorld;
  final String language;
  final List<String> films;
  final List<String> people;

  const SpeciesModel({
    required this.id,
    required this.name,
    required this.classification,
    required this.designation,
    required this.hairColors,
    required this.skinColor,
    required this.eyeColor,
    required this.averageHeight,
    required this.averageLifespan,
    required this.homeWorld,
    required this.films,
    required this.language,
    required this.people,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      id: HelperMethods.extractID(json['url']),
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      hairColors:json['hair_colors'] == 'n/a'? json['hair_colors']:json['hair_colors'].split(', '),
      skinColor: json['skin_colors'] == 'n/a'? json['skin_colors']:json['skin_colors'].split(', '),
      eyeColor: json['eye_colors'] == 'n/a'? json['eye_colors']:json['eye_colors'].split(', '),
      averageHeight: json['average_height'],
      averageLifespan: json['average_lifespan'],
      language: json['language'],
      homeWorld: HelperMethods.extractID(json['homeworld']),
      films: (json['films'] as List<String>)
          .map((e) => HelperMethods.extractID(e))
          .toList(),
      people: (json['people'] as List<String>)
          .map((e) => HelperMethods.extractID(e))
          .toList(),
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        classification,
        designation,
        hairColors,
        skinColor,
        eyeColor,
        averageHeight,
        averageLifespan,
        homeWorld,
        films,
        people,
      ];
}

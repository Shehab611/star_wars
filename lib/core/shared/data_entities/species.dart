import 'package:equatable/equatable.dart';

abstract class Species extends Equatable {
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

  const Species({
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

import 'package:equatable/equatable.dart';

abstract class People extends Equatable {
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

  const People(
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

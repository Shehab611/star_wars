import 'package:equatable/equatable.dart';

abstract class Film extends Equatable {
  final String id;
  final String title;
  final String episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> vehicles;
  final List<String> starships;
  final List<String> species;

  const Film(
      {required this.id,
      required this.title,
      required this.episodeId,
      required this.openingCrawl,
      required this.director,
      required this.producer,
      required this.releaseDate,
      required this.characters,
      required this.planets,
      required this.vehicles,
      required this.species,
      required this.starships,
  });

  @override
  List<Object> get props => [
        id,
        title,
        episodeId,
        openingCrawl,
        director,
        producer,
        releaseDate,
        characters,
        planets,
        vehicles,
        starships,
        species,
      ];
}

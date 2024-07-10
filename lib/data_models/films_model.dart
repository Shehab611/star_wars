import 'package:equatable/equatable.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class FilmsModel extends Equatable {
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

  const FilmsModel(
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
      required this.starships});

  factory FilmsModel.fromJson(Map<String, dynamic> json) {
    return FilmsModel(
        id: HelperMethods.extractID(json['url']),
        title: json['title'],
        episodeId: json['episode_id'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: json['release_date'],
        characters: (json['characters'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        planets: (json['planets'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        vehicles: (json['vehicles'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        starships: (json['starships'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList(),
        species: (json['species'] as List<String>)
            .map((e) => HelperMethods.extractID(e))
            .toList());
  }

  @override
  List<Object> get props => [
        id,
        title,
        episodeId,
        openingCrawl,
        director,
        producer,
        releaseDate,
        species,
        characters,
        planets,
        vehicles,
        starships,
      ];
}

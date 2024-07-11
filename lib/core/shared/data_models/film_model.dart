import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

final class FilmModel extends Film {
  const FilmModel(
      {required super.id,
      required super.title,
      required super.episodeId,
      required super.openingCrawl,
      required super.director,
      required super.producer,
      required super.releaseDate,
      required super.characters,
      required super.planets,
      required super.vehicles,
      required super.species,
      required super.starships});

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
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
}

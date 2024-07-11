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
      required super.starships,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
        id: HelperMethods.extractID(json['url']),
        title: json['title'],
        episodeId: json['episode_id'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: json['release_date'],
        characters: (json['characters'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>(),
        planets:
            (json['planets']).map((e) => HelperMethods.extractID(e))
            .toList(),
        vehicles: (json['vehicles'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>(),
        starships: (json['starships'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>(),
        species: (json['species'])
            .map((e) => HelperMethods.extractID(e))
            .toList()
            .cast<String>());
  }
}

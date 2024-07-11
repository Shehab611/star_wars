import 'package:star_wars/core/shared/data_entities/film.dart';

import 'data_provider.dart';

class FilmDataProvider implements DataProvider {
  final Film film;

  const FilmDataProvider(this.film);

  @override
  String get lowerData => film.episodeId;

  @override
  String get upperData => film.title;
}

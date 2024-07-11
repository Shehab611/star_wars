import 'package:star_wars/core/shared/data_entities/starship.dart';

import 'data_provider.dart';

class StarshipDataProvider implements DataProvider {
  final Starship starship;

  const StarshipDataProvider(this.starship);

  @override
  String get lowerData => starship.starshipClass;

  @override
  String get upperData => starship.name;
}

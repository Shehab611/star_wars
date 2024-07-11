import 'package:star_wars/core/shared/data_entities/species.dart';

import 'data_provider.dart';

class SpeciesDataProvider implements DataProvider {
  final Species species;

  const SpeciesDataProvider(this.species);

  @override
  String get lowerData => species.homeWorld;

  @override
  String get upperData => species.name;
}

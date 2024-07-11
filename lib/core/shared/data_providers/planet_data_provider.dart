import 'package:star_wars/core/shared/data_entities/planet.dart';

import 'data_provider.dart';

class PlanetDataProvider implements DataProvider {
  final Planet planet;

  const PlanetDataProvider(this.planet);

  @override
  String get lowerData => planet.gravity;

  @override
  String get upperData => planet.name;
}

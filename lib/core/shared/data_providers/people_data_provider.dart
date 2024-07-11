import 'package:star_wars/core/shared/data_entities/people.dart';

import 'data_provider.dart';

class PeopleDataProvider implements DataProvider {
  final People people;

  const PeopleDataProvider(this.people);

  @override
  String get lowerData => people.homeWorld;

  @override
  String get upperData => people.name;
}

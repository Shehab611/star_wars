import 'package:flutter/material.dart';
import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/shared/data_models/people_model.dart';
import 'package:star_wars/core/shared/data_providers/people_data_provider.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class PeopleSection extends StatelessWidget {
  const PeopleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget<People>(
      headerText: 'People',
      isLoading: true,
      data: const [
        PeopleModel(
            id: 'id',
            name: 'name',
            height: 'height',
            mass: 'mass',
            hairColor: 'hairColor',
            skinColor: 'skinColor',
            eyeColor: 'eyeColor',
            birthYear: 'birthYear',
            gender: 'gender',
            homeWorld: 'homeWorld',
            films: [],
            canLoadMore: true,
            species: [],
            vehicles: [],
            starships: []),
        PeopleModel(
            id: 'id',
            name: 'name',
            height: 'height',
            mass: 'mass',
            hairColor: 'hairColor',
            skinColor: 'skinColor',
            eyeColor: 'eyeColor',
            birthYear: 'birthYear',
            gender: 'gender',
            homeWorld: 'homeWorld',
            films: [],
            canLoadMore: true,
            species: [],
            vehicles: [],
            starships: []),
      ],
      getDataProvider: (People data) {
        return PeopleDataProvider(data);
      },
    );
  }
}

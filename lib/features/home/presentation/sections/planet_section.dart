import 'package:flutter/material.dart';
import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/shared/data_providers/planet_data_provider.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class PlanetsSection extends StatelessWidget {
  const PlanetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Planet>(
      headerText: 'Planets',
      isLoading: true,
      data: const [],
      getDataProvider: (Planet data) {
        return PlanetDataProvider(data);
      },
    );
  }
}

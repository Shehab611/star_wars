import 'package:flutter/material.dart';
import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/shared/data_providers/species_data_provider.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class SpeciesSection extends StatelessWidget {
  const SpeciesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Species>(
      headerText: 'Species',
      isLoading: true,
      data: const [],
      getDataProvider: (Species data) {
        return SpeciesDataProvider(data);
      },
    );
  }
}

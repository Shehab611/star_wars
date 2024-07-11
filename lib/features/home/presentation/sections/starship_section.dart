import 'package:flutter/material.dart';
import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/core/shared/data_providers/starship_data_provider.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class StarshipsSection extends StatelessWidget {
  const StarshipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Starship>(
      headerText: 'Starships',
      isLoading: true,
      data: const [],
      getDataProvider: (Starship data) {
        return StarshipDataProvider(data);
      },
    );
  }
}

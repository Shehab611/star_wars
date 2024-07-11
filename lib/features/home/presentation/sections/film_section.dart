import 'package:flutter/material.dart';
import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/shared/data_providers/film_data_provider.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class FilmsSection extends StatelessWidget {
  const FilmsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Film>(
      headerText: 'Films',
      data: const [],
      isLoading: true,
      getDataProvider: (Film data) {
        return FilmDataProvider(data);
      },
    );
  }
}

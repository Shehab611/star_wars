import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/shared/data_providers/film_data_provider.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/film_cubit/film_cubit.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class FilmsSection extends StatelessWidget {
  const FilmsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmCubit, FilmState>(
      builder: (context, state) {
        if (state is FilmGetDataFailedState) {
          return Center(child: Text(state.error));
        }
        return SectionWidget<Film>(
          headerText: 'Films',
          isLoading: state is! FilmGetDataSuccessState,
          data: (state is FilmGetDataSuccessState) ? state.data : [],
          getDataProvider: (Film data) {
            return FilmDataProvider(data);
          },
        );
      },
    );
  }
}

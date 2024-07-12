import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/shared/data_providers/film_data_provider.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/app_routes_utils/app_router.dart';
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
          onTap: () {
            AppNavigator.navigateToSeeMoreScreen<Film>(
                context,
                (state is FilmGetDataSuccessState) ? state.data : [],
                AppStrings.films);
          },
          headerText: AppLocalizations.of(context).translate(AppStrings.films),
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

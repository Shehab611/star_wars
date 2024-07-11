import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/core/shared/data_providers/starship_data_provider.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/starship_cubit/starship_cubit.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class StarshipsSection extends StatelessWidget {
  const StarshipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StarshipCubit, StarshipState>(
      builder: (context, state) {
        if (state is StarshipGetDataFailedState) {
          return Center(child: Text(state.error));
        }
        return SectionWidget<Starship>(
          headerText:
              AppLocalizations.of(context).translate(AppStrings.starships),
          isLoading: state is! StarshipGetDataSuccessState,
          data: (state is StarshipGetDataSuccessState) ? state.data : [],
          getDataProvider: (Starship data) {
            return StarshipDataProvider(data);
          },
        );
      },
    );
  }
}

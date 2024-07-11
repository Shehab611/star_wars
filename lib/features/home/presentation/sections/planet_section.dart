import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/shared/data_providers/planet_data_provider.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/planet_cubit/planet_cubit.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class PlanetsSection extends StatelessWidget {
  const PlanetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetCubit, PlanetState>(
      builder: (context, state) {
        if (state is PlanetGetDataFailedState) {
          return Center(child: Text(state.error));
        }
        return SectionWidget<Planet>(
          headerText: 'Planet',
          isLoading: state is! PlanetGetDataSuccessState,
          data: (state is PlanetGetDataSuccessState) ? state.data : [],
          getDataProvider: (Planet data) {
            return PlanetDataProvider(data);
          },
        );
      },
    );
  }
}

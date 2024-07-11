import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/shared/data_providers/species_data_provider.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/species_cubit/species_cubit.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class SpeciesSection extends StatelessWidget {
  const SpeciesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeciesCubit, SpeciesState>(
      builder: (context, state) {
        if (state is SpeciesGetDataFailedState) {
          return Center(child: Text(state.error));
        }
        return SectionWidget<Species>(
          headerText: 'Species',
          isLoading: state is! SpeciesGetDataSuccessState,
          data: (state is SpeciesGetDataSuccessState) ? state.data : [],
          getDataProvider: (Species data) {
            return SpeciesDataProvider(data);
          },
        );
      },
    );
  }
}

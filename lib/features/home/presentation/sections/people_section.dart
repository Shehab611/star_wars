import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/shared/data_providers/people_data_provider.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/people_cubit/people_cubit.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class PeopleSection extends StatelessWidget {
  const PeopleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleCubit, PeopleState>(
      builder: (context, state) {
        if (state is PeopleGetDataFailedState) {
          return Center(child: Text(state.error));
        }
        return SectionWidget<People>(
          headerText: AppLocalizations.of(context).translate(AppStrings.people),
          isLoading: state is! PeopleGetDataSuccessState,
          data: (state is PeopleGetDataSuccessState) ? state.data : [],
          getDataProvider: (People data) {
            return PeopleDataProvider(data);
          },
        );
      },
    );
  }
}

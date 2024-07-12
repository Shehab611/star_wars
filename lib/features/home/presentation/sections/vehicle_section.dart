import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/shared/data_providers/vehicle_data_provider.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/app_routes_utils/app_router.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/vehicle_cubit/vehicle_cubit.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class VehiclesSection extends StatelessWidget {
  const VehiclesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleCubit, VehicleState>(
      builder: (context, state) {
        if (state is VehicleGetDataFailedState) {
          return Center(child: Text(state.error));
        }
        return SectionWidget<Vehicle>(
          onTap: () {
            AppNavigator.navigateToSeeMoreScreen<Vehicle>(
                context,
                (state is VehicleGetDataSuccessState) ? state.data : [],
                AppStrings.vehicles);
          },
          headerText:
              AppLocalizations.of(context).translate(AppStrings.vehicles),
          isLoading: state is! VehicleGetDataSuccessState,
          data: (state is VehicleGetDataSuccessState) ? state.data : [],
          getDataProvider: (Vehicle data) {
            return VehicleDataProvider(data);
          },
        );
      },
    );
  }
}

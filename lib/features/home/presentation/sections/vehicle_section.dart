import 'package:flutter/material.dart';
import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/shared/data_providers/vehicle_data_provider.dart';
import 'package:star_wars/features/home/presentation/widgets/section_widget.dart';

class VehiclesSection extends StatelessWidget {
  const VehiclesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Vehicle>(
      headerText: 'Vehicles',
      isLoading: true,
      data: const [],
      getDataProvider: (Vehicle data) {
        return VehicleDataProvider(data);
      },
    );
  }
}

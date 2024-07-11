import 'package:flutter/material.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';
import 'package:star_wars/features/home/presentation/sections/film_section.dart';
import 'package:star_wars/features/home/presentation/sections/people_section.dart';
import 'package:star_wars/features/home/presentation/sections/planet_section.dart';
import 'package:star_wars/features/home/presentation/sections/species_section.dart';
import 'package:star_wars/features/home/presentation/sections/starship_section.dart';
import 'package:star_wars/features/home/presentation/sections/vehicle_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const widgets = [
    PeopleSection(),
    PlanetsSection(),
    FilmsSection(),
    VehiclesSection(),
    StarshipsSection(),
    SpeciesSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translate(AppStrings.homeScreen)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSizeSeventeen),
        child: CustomScrollView(
          slivers: List.generate(
            widgets.length,
            (index) => SliverPadding(
              padding:
                  const EdgeInsets.only(top: AppSizes.paddingSizeSeventeen),
              sliver: SliverToBoxAdapter(
                child: widgets[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

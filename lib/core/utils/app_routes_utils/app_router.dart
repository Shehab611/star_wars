import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/service_locator.dart';
import 'package:star_wars/features/home/domain/use_cases/get_film_data.dart';
import 'package:star_wars/features/home/domain/use_cases/get_people_data.dart';
import 'package:star_wars/features/home/domain/use_cases/get_planet_data.dart';
import 'package:star_wars/features/home/domain/use_cases/get_species_data.dart';
import 'package:star_wars/features/home/domain/use_cases/get_starship_data.dart';
import 'package:star_wars/features/home/domain/use_cases/get_vehicle_data.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/film_cubit/film_cubit.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/people_cubit/people_cubit.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/planet_cubit/planet_cubit.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/species_cubit/species_cubit.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/starship_cubit/starship_cubit.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/vehicle_cubit/vehicle_cubit.dart';
import 'package:star_wars/features/home/presentation/views/home_screen.dart';

part 'app_navigator.dart';
part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kHomeScreen: (BuildContext context) =>
        MultiBlocProvider(providers: [
          BlocProvider(
              create: (context) =>
                  PeopleCubit(GetPeopleData(sl.get()))..getData()),
          BlocProvider(
              create: (context) =>
                  PlanetCubit(GetPlanetData(sl.get()))..getData()),
          BlocProvider(
              create: (context) =>
                  VehicleCubit(GetVehicleData(sl.get()))..getData()),
          BlocProvider(
              create: (context) => FilmCubit(GetFilmData(sl.get()))..getData()),
          BlocProvider(
              create: (context) =>
                  SpeciesCubit(GetSpeciesData(sl.get()))..getData()),
          BlocProvider(
              create: (context) =>
                  StarshipCubit(GetStarshipData(sl.get()))..getData()),
        ], child: const HomeScreen())
  };
}

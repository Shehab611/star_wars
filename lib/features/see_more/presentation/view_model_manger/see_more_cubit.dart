import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/base_use_case/base_use_case.dart';
import 'package:star_wars/core/service_locator.dart';
import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/shared/data_models/people_model.dart';
import 'package:star_wars/core/shared/data_models/planet_model.dart';
import 'package:star_wars/core/shared/data_models/species_model.dart';
import 'package:star_wars/core/shared/data_models/starship_model.dart';
import 'package:star_wars/core/shared/data_models/vehicle_model.dart';
import 'package:star_wars/core/shared/data_providers/data_provider.dart';
import 'package:star_wars/core/shared/data_providers/film_data_provider.dart';
import 'package:star_wars/core/shared/data_providers/people_data_provider.dart';
import 'package:star_wars/core/shared/data_providers/planet_data_provider.dart';
import 'package:star_wars/core/shared/data_providers/species_data_provider.dart';
import 'package:star_wars/core/shared/data_providers/starship_data_provider.dart';
import 'package:star_wars/core/shared/data_providers/vehicle_data_provider.dart';
import 'package:star_wars/core/shared/use_cases/get_film_data.dart';
import 'package:star_wars/core/shared/use_cases/get_people_data.dart';
import 'package:star_wars/core/shared/use_cases/get_planet_data.dart';
import 'package:star_wars/core/shared/use_cases/get_species_data.dart';
import 'package:star_wars/core/shared/use_cases/get_starship_data.dart';
import 'package:star_wars/core/shared/use_cases/get_vehicle_data.dart';

part 'see_more_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  SeeMoreCubit() : super(const SeeMoreInitial());

  //#region Private Variables
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool _loading = false;
  bool _canLoadMore = true;

  //#endregion

  //#region Getters
  bool get canLoadMore => _canLoadMore;

  bool get loading => _loading;

  ScrollController get scrollController => _scrollController;

//#endregion

  //#region Private Methods
  Future<void> _getData(List data) async {
    BaseUseCaseInterface repo;
    if (data[0] is PeopleModel) {
      repo = GetPeopleData(sl.get());
    } else if (data[0] is PlanetModel) {
      repo = GetPlanetData(sl.get());
    } else if (data[0] is VehicleModel) {
      repo = GetVehicleData(sl.get());
    } else if (data[0] is StarshipModel) {
      repo = GetStarshipData(sl.get());
    } else if (data[0] is SpeciesModel) {
      repo = GetSpeciesData(sl.get());
    } else {
      repo = GetFilmData(sl.get()); // Assuming Film is the fallback
    }

    _loading = true;
    emit(const SeeMoreLoadingState());
    final response = await repo.call(_page);
    if (response.error == null) {
      _page++;
      _canLoadMore = response.data!.canLoadMore;
      data.addAll(response.data!.data);
      emit(switch (data[0].runtimeType) {
        PeopleModel => SeeMoreSuccessState<People>(data.cast<People>()),
        PlanetModel => SeeMoreSuccessState<Planet>(data.cast<Planet>()),
        VehicleModel => SeeMoreSuccessState<Vehicle>(data.cast<Vehicle>()),
        StarshipModel => SeeMoreSuccessState<Starship>(data.cast<Starship>()),
        SpeciesModel => SeeMoreSuccessState<Species>(data.cast<Species>()),
        _ => SeeMoreSuccessState<Film>(data.cast<Film>()),
      });
    } else {
      emit(SeeMoreFailedState(response.error!));
    }
    _loading = false;
  }

//#endregion

  //#region Public Methods
  Future<void> getData(List data) async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_loading &&
        _canLoadMore) {
      await _getData(data);
    }
  }

  DataProvider getDataProvider<T>(T data) {
    return switch (data.runtimeType) {
      PeopleModel => PeopleDataProvider(data as People),
      PlanetModel => PlanetDataProvider(data as Planet),
      VehicleModel => VehicleDataProvider(data as Vehicle),
      StarshipModel => StarshipDataProvider(data as Starship),
      SpeciesModel => SpeciesDataProvider(data as Species),
      _ => FilmDataProvider(data as Film),
    };
  }

//#endregion
}

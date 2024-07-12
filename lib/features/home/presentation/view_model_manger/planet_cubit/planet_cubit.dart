import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/planet.dart';
import 'package:star_wars/core/shared/use_cases/get_planet_data.dart';

part 'planet_state.dart';

class PlanetCubit extends Cubit<PlanetState> {
  PlanetCubit(this._repo) : super(const PlanetInitial());

  //#region Private Variables
  final GetPlanetData _repo;

  //#endregion

  //#region Private Methods
  Future<void> _getData() async {
    emit(const PlanetGetDataLoadingState());
    final response = await _repo.call();
    if (response.error == null) {
      emit(PlanetGetDataSuccessState(response.data!.data));
    } else {
      emit(PlanetGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getData() async {
    await _getData();
  }

//#endregion
}

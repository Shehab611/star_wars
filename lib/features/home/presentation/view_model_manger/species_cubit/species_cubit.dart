import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/species.dart';
import 'package:star_wars/features/home/domain/use_cases/get_Species_data.dart';

part 'species_state.dart';

class SpeciesCubit extends Cubit<SpeciesState> {
  SpeciesCubit(this._repo) : super(const SpeciesInitial());

  //#region Private Variables
  final GetSpeciesData _repo;

  //#endregion

  //#region Private Methods
  Future<void> _getData() async {
    emit(const SpeciesGetDataLoadingState());
    final response = await _repo.call();
    if (response.error == null) {
      emit(SpeciesGetDataSuccessState(response.data!.data));
    } else {
      emit(SpeciesGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getData() async {
    await _getData();
  }

//#endregion
}

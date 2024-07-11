import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/starship.dart';
import 'package:star_wars/features/home/domain/use_cases/get_starship_data.dart';

part 'starship_state.dart';

class StarshipCubit extends Cubit<StarshipState> {
  StarshipCubit(this._repo) : super(const StarshipInitial());

  //#region Private Variables
  final GetStarshipData _repo;

  //#endregion

  //#region Private Methods
  Future<void> _getData() async {
    emit(const StarshipGetDataLoadingState());
    final response = await _repo.call();
    if (response.error == null) {
      emit(StarshipGetDataSuccessState(response.data!.data));
    } else {
      emit(StarshipGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getData() async {
    await _getData();
  }

//#endregion
}

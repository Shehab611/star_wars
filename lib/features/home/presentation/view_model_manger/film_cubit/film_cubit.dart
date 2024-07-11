import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/film.dart';
import 'package:star_wars/features/home/domain/use_cases/get_film_data.dart';

part 'film_state.dart';

class FilmCubit extends Cubit<FilmState> {
  FilmCubit(this._repo) : super(const FilmInitial());

  //#region Private Variables
  final GetFilmData _repo;

  //#endregion

  //#region Private Methods
  Future<void> _getData() async {
    emit(const FilmGetDataLoadingState());
    final response = await _repo.call();
    if (response.error == null) {
      emit(FilmGetDataSuccessState(response.data!.data));
    } else {
      emit(FilmGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getData() async {
    await _getData();
  }

//#endregion
}

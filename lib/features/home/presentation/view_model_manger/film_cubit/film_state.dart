part of 'film_cubit.dart';

sealed class FilmState extends Equatable {
  const FilmState();
}

final class FilmInitial extends FilmState {
  const FilmInitial();

  @override
  List<Object> get props => [];
}

final class FilmGetDataLoadingState extends FilmState {
  const FilmGetDataLoadingState();

  @override
  List<Object> get props => [];
}

final class FilmGetDataSuccessState extends FilmState {
  const FilmGetDataSuccessState(this.data);

  final List<Film> data;

  @override
  List<Object> get props => [];
}

final class FilmGetDataFailedState extends FilmState {
  const FilmGetDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

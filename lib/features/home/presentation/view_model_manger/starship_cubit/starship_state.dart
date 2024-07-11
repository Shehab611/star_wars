part of 'starship_cubit.dart';

sealed class StarshipState extends Equatable {
  const StarshipState();
}

final class StarshipInitial extends StarshipState {
  const StarshipInitial();

  @override
  List<Object> get props => [];
}

final class StarshipGetDataLoadingState extends StarshipState {
  const StarshipGetDataLoadingState();

  @override
  List<Object> get props => [];
}

final class StarshipGetDataSuccessState extends StarshipState {
  const StarshipGetDataSuccessState(this.data);

  final List<Starship> data;

  @override
  List<Object> get props => [];
}

final class StarshipGetDataFailedState extends StarshipState {
  const StarshipGetDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

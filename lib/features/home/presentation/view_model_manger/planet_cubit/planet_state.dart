part of 'planet_cubit.dart';

sealed class PlanetState extends Equatable {
  const PlanetState();
}

final class PlanetInitial extends PlanetState {
  const PlanetInitial();

  @override
  List<Object> get props => [];
}

final class PlanetGetDataLoadingState extends PlanetState {
  const PlanetGetDataLoadingState();

  @override
  List<Object> get props => [];
}

final class PlanetGetDataSuccessState extends PlanetState {
  const PlanetGetDataSuccessState(this.data);

  final List<Planet> data;

  @override
  List<Object> get props => [];
}

final class PlanetGetDataFailedState extends PlanetState {
  const PlanetGetDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

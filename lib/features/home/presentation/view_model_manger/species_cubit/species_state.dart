part of 'species_cubit.dart';

sealed class SpeciesState extends Equatable {
  const SpeciesState();
}

final class SpeciesInitial extends SpeciesState {
  const SpeciesInitial();

  @override
  List<Object> get props => [];
}

final class SpeciesGetDataLoadingState extends SpeciesState {
  const SpeciesGetDataLoadingState();

  @override
  List<Object> get props => [];
}

final class SpeciesGetDataSuccessState extends SpeciesState {
  const SpeciesGetDataSuccessState(this.data);

  final List<Species> data;

  @override
  List<Object> get props => [];
}

final class SpeciesGetDataFailedState extends SpeciesState {
  const SpeciesGetDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

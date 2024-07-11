part of 'people_cubit.dart';

sealed class PeopleState extends Equatable {
  const PeopleState();
}

final class PeopleInitial extends PeopleState {
  const PeopleInitial();

  @override
  List<Object> get props => [];
}

final class PeopleGetDataLoadingState extends PeopleState {
  const PeopleGetDataLoadingState();

  @override
  List<Object> get props => [];
}

final class PeopleGetDataSuccessState extends PeopleState {
  const PeopleGetDataSuccessState(this.data);

  final List<People> data;

  @override
  List<Object> get props => [];
}

final class PeopleGetDataFailedState extends PeopleState {
  const PeopleGetDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}
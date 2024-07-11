part of 'people_cubit.dart';

sealed class PeopleState extends Equatable {
  const PeopleState();
}

final class PeopleInitial extends PeopleState {
  const PeopleInitial();

  @override
  List<Object> get props => [];
}

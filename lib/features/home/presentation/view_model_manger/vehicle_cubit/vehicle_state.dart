part of 'vehicle_cubit.dart';

sealed class VehicleState extends Equatable {
  const VehicleState();
}

final class VehicleInitial extends VehicleState {
  const VehicleInitial();

  @override
  List<Object> get props => [];
}

final class VehicleGetDataLoadingState extends VehicleState {
  const VehicleGetDataLoadingState();

  @override
  List<Object> get props => [];
}

final class VehicleGetDataSuccessState extends VehicleState {
  const VehicleGetDataSuccessState(this.data);

  final List<Vehicle> data;

  @override
  List<Object> get props => [];
}

final class VehicleGetDataFailedState extends VehicleState {
  const VehicleGetDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

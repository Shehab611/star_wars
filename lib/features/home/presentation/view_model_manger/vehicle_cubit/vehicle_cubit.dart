import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/vehicle.dart';
import 'package:star_wars/core/shared/use_cases/get_vehicle_data.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  VehicleCubit(this._repo) : super(const VehicleInitial());

  //#region Private Variables
  final GetVehicleData _repo;

  //#endregion

  //#region Private Methods
  Future<void> _getData() async {
    emit(const VehicleGetDataLoadingState());
    final response = await _repo.call();
    if (response.error == null) {
      emit(VehicleGetDataSuccessState(response.data!.data));
    } else {
      emit(VehicleGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getData() async {
    await _getData();
  }

//#endregion
}

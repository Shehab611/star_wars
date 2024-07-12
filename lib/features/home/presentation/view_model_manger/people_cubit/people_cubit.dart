import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/shared/data_entities/people.dart';
import 'package:star_wars/core/shared/use_cases/get_people_data.dart';

part 'people_state.dart';

class PeopleCubit extends Cubit<PeopleState> {
  PeopleCubit(this._repo) : super(const PeopleInitial());

  //#region Private Variables
  final GetPeopleData _repo;

  //#endregion

  //#region Private Methods
  Future<void> _getData() async {
    emit(const PeopleGetDataLoadingState());
    final response = await _repo.call();
    if (response.error == null) {
      emit(PeopleGetDataSuccessState(response.data!.data));
    } else {
      emit(PeopleGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getData() async {
    await _getData();
  }

//#endregion
}

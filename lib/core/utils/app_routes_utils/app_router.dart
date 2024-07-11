import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/service_locator.dart';
import 'package:star_wars/features/home/domain/use_cases/get_people_data.dart';
import 'package:star_wars/features/home/presentation/view_model_manger/people_cubit/people_cubit.dart';
import 'package:star_wars/features/home/presentation/views/home_screen.dart';

part 'app_navigator.dart';
part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kHomeScreen: (BuildContext context) => BlocProvider(
          create: (context) => PeopleCubit(GetPeopleData(sl.get()))..getData(),
          child: const HomeScreen(),
        )
  };
}

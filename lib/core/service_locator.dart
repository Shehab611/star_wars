import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_wars/core/usable_functions/api_service_helper.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';
import 'package:star_wars/features/home/data/repositories/film_repository.dart';
import 'package:star_wars/features/home/data/repositories/people_repository.dart';
import 'package:star_wars/features/home/data/repositories/planet_repository.dart';
import 'package:star_wars/features/home/data/repositories/species_repository.dart';
import 'package:star_wars/features/home/data/repositories/starship_repository.dart';
import 'package:star_wars/features/home/data/repositories/vehicle_repository.dart';
import 'package:star_wars/features/home/data/sources/remote/remote_data_source_interfaces.dart';
import 'package:star_wars/features/home/domain/repositories/film_interface.dart';
import 'package:star_wars/features/home/domain/repositories/people_interface.dart';
import 'package:star_wars/features/home/domain/repositories/planet_interface.dart';
import 'package:star_wars/features/home/domain/repositories/species_interface.dart';
import 'package:star_wars/features/home/domain/repositories/starship_interface.dart';
import 'package:star_wars/features/home/domain/repositories/vehicle_interface.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  //#region Core
  sl.registerLazySingleton<DioClient>(() =>
      DioClient(ApiEndPoints.baseUrl, sl.get(), loggingInterceptor: sl.get()));
  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton<ApiResponseHandler>(
      () => ApiResponseHandler(sl.get()));
  //#endregion

  //#region Repos
  sl.registerLazySingleton<PeopleInterface>(
      () => PeopleRepositoryImpl(sl.get()));

  sl.registerLazySingleton<FilmInterface>(() => FilmRepositoryImpl(sl.get()));

  sl.registerLazySingleton<PlanetInterface>(
      () => PlanetRepositoryImpl(sl.get()));

  sl.registerLazySingleton<StarshipInterface>(
      () => StarshipRepositoryImpl(sl.get()));

  sl.registerLazySingleton<VehicleInterface>(
      () => VehicleRepositoryImpl(sl.get()));

  sl.registerLazySingleton<SpeciesInterface>(
      () => SpeciesRepositoryImpl(sl.get()));
  //#endregion

  //#region Data Sources
  sl.registerLazySingleton<PeopleRemoteDataSourceInterface>(
      () => PeopleRemoteDataSourceImpl(sl.get()));
  sl.registerLazySingleton<FilmRemoteDataSourceInterface>(
      () => FilmRemoteDataSourceImpl(sl.get()));
  sl.registerLazySingleton<PlanetRemoteDataSourceInterface>(
      () => PlanetRemoteDataSourceImpl(sl.get()));
  sl.registerLazySingleton<VehicleRemoteDataSourceInterface>(
      () => VehicleRemoteDataSourceImpl(sl.get()));
  sl.registerLazySingleton<StarshipRemoteDataSourceInterface>(
      () => StarshipRemoteDataSourceImpl(sl.get()));
  sl.registerLazySingleton<SpeciesRemoteDataSourceInterface>(
      () => SpeciesRemoteDataSourceImpl(sl.get()));
  //#endregion

  //#region External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());

  //#endregion
}

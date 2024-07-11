import 'package:star_wars/core/shared/data_models/film_model.dart';
import 'package:star_wars/core/shared/data_models/people_model.dart';
import 'package:star_wars/core/shared/data_models/planet_model.dart';
import 'package:star_wars/core/shared/data_models/species_model.dart';
import 'package:star_wars/core/shared/data_models/starship_model.dart';
import 'package:star_wars/core/shared/data_models/vehicle_model.dart';
import 'package:star_wars/core/usable_functions/api_service_helper.dart';

part 'people_remote_data_source.dart';

abstract interface class PeopleRemoteDataSourceInterface {
  Future<List<PeopleModel>> getPeopleData(int pageNum);
}

abstract interface class FilmRemoteDataSourceInterface {
  Future<List<FilmModel>> getFilmData(int pageNum);
}

abstract interface class VehicleRemoteDataSourceInterface {
  Future<List<VehicleModel>> getVehicleData(int pageNum);
}

abstract interface class StarshipRemoteDataSourceInterface {
  Future<List<StarshipModel>> getStarshipData(int pageNum);
}

abstract interface class PlanetRemoteDataSourceInterface {
  Future<List<PlanetModel>> getPlanetData(int pageNum);
}

abstract interface class SpeciesRemoteDataSourceInterface {
  Future<List<SpeciesModel>> getSpeciesData(int pageNum);
}

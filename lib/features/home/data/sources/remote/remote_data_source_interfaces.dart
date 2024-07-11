import 'package:star_wars/core/shared/data_models/base_model.dart';
import 'package:star_wars/core/shared/data_models/film_model.dart';
import 'package:star_wars/core/shared/data_models/people_model.dart';
import 'package:star_wars/core/shared/data_models/planet_model.dart';
import 'package:star_wars/core/shared/data_models/species_model.dart';
import 'package:star_wars/core/shared/data_models/starship_model.dart';
import 'package:star_wars/core/shared/data_models/vehicle_model.dart';
import 'package:star_wars/core/usable_functions/api_service_helper.dart';
import 'package:star_wars/core/usable_functions/helper_methods.dart';

part 'film_remote_data_source.dart';
part 'people_remote_data_source.dart';
part 'planet_remote_data_source.dart';
part 'species_remote_data_source.dart';
part 'starship_remote_data_source.dart';
part 'vehicle_remote_data_source.dart';

abstract interface class PeopleRemoteDataSourceInterface {
  Future<BaseModel<List<PeopleModel>>> getPeopleData(int pageNum);
}

abstract interface class FilmRemoteDataSourceInterface {
  Future<BaseModel<List<FilmModel>>> getFilmData(int pageNum);
}

abstract interface class VehicleRemoteDataSourceInterface {
  Future<BaseModel<List<VehicleModel>>> getVehicleData(int pageNum);
}

abstract interface class StarshipRemoteDataSourceInterface {
  Future<BaseModel<List<StarshipModel>>> getStarshipData(int pageNum);
}

abstract interface class PlanetRemoteDataSourceInterface {
  Future<BaseModel<List<PlanetModel>>> getPlanetData(int pageNum);
}

abstract interface class SpeciesRemoteDataSourceInterface {
  Future<BaseModel<List<SpeciesModel>>> getSpeciesData(int pageNum);
}

part of '../../usable_functions/api_service_helper.dart';

abstract final class ApiEndPoints {
  //#region Private variables can not be accessed

  //#region Basic Configurations

  static const String _host = 'https://swapi.dev';
  static const String _api = '$_host/api';

  //#endregion

  //#region EndPoints
  static const String _films = '/films';

  static const String _people = '/people';

  static const String _planets = '/planets';

  static const String _species = '/species';

  static const String _starships = '/starships';

  static const String _vehicles = '/vehicles';

  //#endregion

  //#endregion

  //#region Getters to use them in the app
  //#region Basic Configurations
  ///Api base url
  static String get baseUrl => _api;

  //#endregion
  //#region EndPoints
  static String get films => _films;

  static String get people => _people;

  static String get planets => _planets;

  static String get species => _species;

  static String get starships => _starships;

  static String get vehicles => _vehicles;

//#endregion

//#endregion
}

import 'package:case_study/data/repository/weather_repository.dart';
import 'package:case_study/data/services/dio_client.dart';
import 'package:case_study/data/services/weather_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => DioClient());
  locator.registerLazySingleton(() => WeatherClient());
  locator.registerLazySingleton(() => WeatherRepository());
}

import 'package:case_study/data/model/weather.dart';

abstract class WeatherBase{
  Future<Weather>getWeather(String query);
}
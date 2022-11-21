import 'package:case_study/data/model/weather.dart';
import 'package:case_study/data/services/weather_client.dart';
import 'package:case_study/domain/repository/weather_base.dart';
import 'package:case_study/locator.dart';

class WeatherRepository implements WeatherBase {
  final _weatherClient = locator<WeatherClient>();
  @override
  Future<Weather> getWeather(String query) {
    return _weatherClient.getWeather(query);
  }
}

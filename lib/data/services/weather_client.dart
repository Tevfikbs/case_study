import 'package:case_study/data/model/weather.dart';
import 'package:case_study/data/services/dio_client.dart';
import 'package:case_study/domain/repository/weather_base.dart';
import 'package:case_study/locator.dart';

class WeatherClient implements WeatherBase {
  final DioClient _dioClient = locator<DioClient>();
  final String accessKey = "10534fef71dbfccdf39159ae1cc41b21";

  @override
  Future<Weather> getWeather(String query) async {
    try {
      var result =
          await _dioClient.dio.get("?access_key=$accessKey&query=$query");

      print(result.data.toString());
      var data = Weather.fromMap(result.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:hive/hive.dart';

part 'weather_hive.g.dart';

@HiveType(typeId: 0)
class WeatherHive {
  @HiveField(0)
  final List<String>? weatherDescriptions;

  @HiveField(1)
  final String? isDay;

  @HiveField(2)
  final int? temperature;

  @HiveField(3)
  final List<String>? weatherIcons;

  @HiveField(4)
  final int? windSpeed;

  @HiveField(5)
  final String? windDir;

  @HiveField(6)
  final int? pressure;

  @HiveField(7)
  final int? humidity;

  @HiveField(8)
  final int? feelslike;

  @HiveField(9)
  final int? visibility;

  @HiveField(10)
  final String? localtime;

  @HiveField(11)
  final String? name;

  @HiveField(12)
  final String? country;

  WeatherHive(
      {this.country,
      this.feelslike,
      this.humidity,
      this.isDay,
      this.localtime,
      this.name,
      this.pressure,
      this.temperature,
      this.visibility,
      this.weatherDescriptions,
      this.weatherIcons,
      this.windDir,
      this.windSpeed});
}

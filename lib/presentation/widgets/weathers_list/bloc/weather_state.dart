part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final int? indicator;
  List<WeatherHive> weatherList = [];
  WeatherLoadedState({required this.weatherList, this.indicator});
}

class WeatherErrorState extends WeatherState {}

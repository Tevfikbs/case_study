part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String? query;
  final int? indicator;
  const FetchWeatherEvent({this.query, this.indicator});
}

class FetchWeatherListEvent extends WeatherEvent {
  final bool? visibility;
  const FetchWeatherListEvent({this.visibility});
}

class FetchIndicatorEvent extends WeatherEvent {
  final int? indicator;
  const FetchIndicatorEvent({this.indicator});
}

class FetchDeleteItemEvent extends WeatherEvent {
  final dynamic index;
  const FetchDeleteItemEvent({this.index});
}

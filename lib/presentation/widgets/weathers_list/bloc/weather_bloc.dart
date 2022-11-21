import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:case_study/data/model/weather.dart';
import 'package:case_study/data/model/weather_hive.dart';
import 'package:case_study/data/repository/weather_repository.dart';
import 'package:case_study/locator.dart';
import 'package:case_study/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = locator<WeatherRepository>();
  int? indicator;
  List<WeatherHive> weatherList = [];
  Weather? _weather;
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherListEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());
        for (var i = 0; i < box.values.length; i++) {
          WeatherHive listElement = box.getAt(i)!;
          weatherList.add(listElement);
        }
        indicator = 0;
        emit(WeatherLoadedState(weatherList: weatherList, indicator: indicator));
      },
    );
    on<FetchWeatherEvent>((event, emit) async {
      try {
        emit(WeatherLoadingState());

        _weather = await _weatherRepository.getWeather(event.query!);
        await box.add(WeatherHive(
            country: _weather!.location!.country,
            feelslike: _weather!.current!.feelslike,
            humidity: _weather!.current!.humidity,
            isDay: _weather!.current!.isDay,
            localtime: _weather!.location!.localtime,
            name: _weather!.location!.name,
            pressure: _weather!.current!.pressure,
            temperature: _weather!.current!.temperature,
            visibility: _weather!.current!.visibility,
            weatherDescriptions: _weather!.current!.weatherDescriptions,
            weatherIcons: _weather!.current!.weatherIcons,
            windDir: _weather!.current!.windDir,
            windSpeed: _weather!.current!.windSpeed));

        WeatherHive listElement = box.getAt(box.values.length - 1)!;
        weatherList.add(listElement);
        indicator = box.values.length - 1;

        emit(
            WeatherLoadedState(weatherList: weatherList, indicator: indicator));
      } catch (_) {
        emit(WeatherErrorState());
      }
    });
    on<FetchIndicatorEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());
        indicator = event.indicator;
        emit(
            WeatherLoadedState(weatherList: weatherList, indicator: indicator));
      },
    );
    on<FetchDeleteItemEvent>(
      (event, emit) {
        emit(WeatherLoadingState());
        box.deleteAt(event.index);
        weatherList = [];
        for (var i = 0; i < box.values.length; i++) {
          WeatherHive listElement = box.getAt(i)!;
          weatherList.add(listElement);
        }
        indicator =
            indicator == weatherList.length ? indicator! - 1 : indicator;
        emit(
            WeatherLoadedState(weatherList: weatherList, indicator: indicator));
      },
    );
  }
}

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/screens/weather_page.dart' as _i1;
import '../../presentation/widgets/weathers_list/bloc/weather_details.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    WeatherRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WeatherPage(),
      );
    },
    WeatherDetails.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailsArgs>(
          orElse: () => const WeatherDetailsArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.WeatherDetails(
          key: args.key,
          backgroundWidget: args.backgroundWidget,
          feelslike: args.feelslike,
          humidity: args.humidity,
          pressure: args.pressure,
          windDir: args.windDir,
          visibility: args.visibility,
          speed: args.speed,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          WeatherRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          WeatherDetails.name,
          path: '/weather-details',
        ),
      ];
}

/// generated route for
/// [_i1.WeatherPage]
class WeatherRoute extends _i3.PageRouteInfo<void> {
  const WeatherRoute()
      : super(
          WeatherRoute.name,
          path: '/',
        );

  static const String name = 'WeatherRoute';
}

/// generated route for
/// [_i2.WeatherDetails]
class WeatherDetails extends _i3.PageRouteInfo<WeatherDetailsArgs> {
  WeatherDetails({
    _i5.Key? key,
    _i5.Widget? backgroundWidget,
    int? feelslike,
    int? humidity,
    int? pressure,
    String? windDir,
    int? visibility,
    int? speed,
  }) : super(
          WeatherDetails.name,
          path: '/weather-details',
          args: WeatherDetailsArgs(
            key: key,
            backgroundWidget: backgroundWidget,
            feelslike: feelslike,
            humidity: humidity,
            pressure: pressure,
            windDir: windDir,
            visibility: visibility,
            speed: speed,
          ),
        );

  static const String name = 'WeatherDetails';
}

class WeatherDetailsArgs {
  const WeatherDetailsArgs({
    this.key,
    this.backgroundWidget,
    this.feelslike,
    this.humidity,
    this.pressure,
    this.windDir,
    this.visibility,
    this.speed,
  });

  final _i5.Key? key;

  final _i5.Widget? backgroundWidget;

  final int? feelslike;

  final int? humidity;

  final int? pressure;

  final String? windDir;

  final int? visibility;

  final int? speed;

  @override
  String toString() {
    return 'WeatherDetailsArgs{key: $key, backgroundWidget: $backgroundWidget, feelslike: $feelslike, humidity: $humidity, pressure: $pressure, windDir: $windDir, visibility: $visibility, speed: $speed}';
  }
}

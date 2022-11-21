import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:case_study/presentation/widgets/weathers_list/bloc/weather_bloc.dart';
import 'package:case_study/product/navigator/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

class WeatherSlider extends StatefulWidget {
  const WeatherSlider({super.key});

  @override
  State<WeatherSlider> createState() => _WeatherSliderState();
}

class _WeatherSliderState extends State<WeatherSlider> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Container(color: Colors.grey.shade900,child: const Center(child: CircularProgressIndicator()));
          }
          if (state is WeatherLoadedState) {
            return CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  weatherBloc.add(
                    FetchIndicatorEvent(indicator: index),
                  );
                },
                initialPage: state.indicator!,
                height: height,
                enableInfiniteScroll: false,
                viewportFraction: 1.1,
                enlargeCenterPage: false,
              ),
              items: state.weatherList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        context.router.push(WeatherDetails(
                          backgroundWidget: weatherBackground(
                              i.weatherDescriptions.toString(),
                              i.isDay.toString(),
                              width,
                              height),
                          windDir: i.windDir,
                          speed: i.windSpeed,
                          humidity: i.humidity,
                          feelslike: i.feelslike,
                          pressure: i.pressure,
                          visibility: i.visibility,
                        ));
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.black),
                          child: Stack(
                            children: [
                              Center(
                                  child: weatherBackground(
                                      i.weatherDescriptions.toString(),
                                      i.isDay.toString(),
                                      width,
                                      height)),
                              Positioned(
                                top: 120,
                                right: 10,
                                child: IconButton(
                                  onPressed: () {
                                    weatherBloc.add(FetchDeleteItemEvent(
                                        index: state.indicator!));
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.trash_circle_fill,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 180,
                                left: 140,
                                child: Column(
                                  children: [
                                    Text(
                                      i.localtime!.substring(11, 16),
                                      style: const TextStyle(
                                          fontSize: 50, color: Colors.white),
                                    ),
                                    Text(
                                      i.localtime!.substring(0, 11),
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 180,
                                left: 40,
                                child: SizedBox(
                                  width: width * 0.9,
                                  child: Text(
                                    i.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 40, color: Colors.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 160,
                                left: 40,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    Text(
                                      "${i.country}",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 40,
                                child: Text(
                                  "${i.temperature}°",
                                  style: const TextStyle(
                                      fontSize: 100, color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: state.weatherList
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    return Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Colors.white).withOpacity(
                                              state.indicator == entry.key
                                                  ? 0.9
                                                  : 0.4)),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Positioned(
                                  bottom: 70,
                                  right: 30,
                                  child: Image.network(
                                      i.weatherIcons![0].toString()))
                            ],
                          )),
                    );
                  },
                );
              }).toList(),
            );
          }
          return Container();
        });
  }
}

weatherBackground(String type, String isDay, double width, double height) {
  if (type == "[Partly cloudy]" || type == "[Cloudy]" || type == "[Overcast]") {
    if (isDay == "yes") {
      return WeatherBg(
        weatherType: WeatherType.cloudy,
        width: width,
        height: height,
      );
    } else {
      return WeatherBg(
        weatherType: WeatherType.cloudyNight,
        width: width,
        height: height,
      );
    }
  } else if (type == "[Sunny]") {
    if (isDay == "yes") {
      return WeatherBg(
        weatherType: WeatherType.sunny,
        width: width,
        height: height,
      );
    } else {
      return WeatherBg(
        weatherType: WeatherType.sunnyNight,
        width: width,
        height: height,
      );
    }
  } else if (type == "[Patchy rain possible]" ||
      type == "[Patchy freezing drizzle possible]" ||
      type == "[Patchy light drizzle]" ||
      type == "[Light drizzle]" ||
      type == "[Freezing drizzle]" ||
      type == "[Heavy freezing drizzle]" ||
      type == "[Patchy light rain]" ||
      type == "[Light rain]" ||
      type == "[Moderate rain at times]" ||
      type == "[Moderate rain]" ||
      type == "[Heavy rain at times]" ||
      type == "Heavy rain" ||
      type == "[Light freezing rain]" ||
      type == "[Light Rain Shower]") {
    return WeatherBg(
      weatherType: WeatherType.middleRainy,
      width: width,
      height: height,
    );
  } else if (type == "[Light Snow]" ||
      type == "[Cloudy]" ||
      type == "[Cloud]" ||
      type == "[Patchy sleet possible]" ||
      type == "[Patchy snow possible]" ||
      type == "[Blowing snow]" ||
      type == "[Blizzard]") {
    return WeatherBg(
      weatherType: WeatherType.middleSnow,
      width: width,
      height: height,
    );
  } else if (type == "[Mist]" || type == "[Fog]" || type == "[Freezing fog]") {
    return WeatherBg(
      weatherType: WeatherType.foggy,
      width: width,
      height: height,
    );
  } else {
    return WeatherBg(
      weatherType: WeatherType.thunder,
      width: width,
      height: height,
    );
  }
}

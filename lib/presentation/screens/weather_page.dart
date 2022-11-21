import 'package:carousel_slider/carousel_controller.dart';
import 'package:case_study/presentation/widgets/weathers_list/bloc/weather_bloc.dart';
import 'package:case_study/presentation/widgets/weathers_list/weather_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final fieldText = TextEditingController();
  final CarouselController controller = CarouselController();
  String? query;
  bool? isAdded;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadedState) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: SizedBox(
              width: width * 0.9,
              child: TextField(
                controller: fieldText,
                // controller: _textController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "City Name...",
                  hintStyle: const TextStyle(color: Colors.white),
                  contentPadding: const EdgeInsets.all(5),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(width: 2, color: Colors.white),
                  ),
                  disabledBorder: InputBorder.none,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        for (var i = 0; i < state.weatherList.length; i++) {
                          if (state.weatherList[i].name!.toLowerCase() == query!.toLowerCase()) {
                            isAdded = true;
                            break;
                          } else {
                            isAdded = false;
                          }
                        }
                        if (state.weatherList.length < 5) {
                          if (isAdded == true) {
                            isCityAddedToast();
                          } else {
                            weatherBloc.add(FetchWeatherEvent(
                              query: query,
                            ));

                            fieldText.clear();
                          }
                        } else {
                          listSizeToast();
                        }
                        // showToast(state.isAdded!);
                      },
                      icon: const Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        color: Colors.white,
                      )),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
                onChanged: (s) {
                  query = s;
                },
              ),
            ),
          ),
          body: state.weatherList.isNotEmpty
              ? const WeatherSlider()
              : Container(
                  color: Colors.grey.shade900,
                  child: const Center(
                    child: Text(
                      "Search city for weather forecast",
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                    ),
                  ),
                ),
        );
      } else {
        return Scaffold(
          body: Container(
            color: Colors.grey.shade900,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            ),
          ),
        );
      }
    });
  }
}

isCityAddedToast() {
  Fluttertoast.showToast(
      msg: "This city has been added before",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      fontSize: 16.0);
}

listSizeToast() {
  Fluttertoast.showToast(
      msg: "To add a new City, you need to delete a city from the list.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      fontSize: 16.0);
}

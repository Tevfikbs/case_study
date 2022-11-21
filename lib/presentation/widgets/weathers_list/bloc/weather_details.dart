import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails(
      {super.key,
      this.backgroundWidget,
      this.feelslike,
      this.humidity,
      this.pressure,
      this.windDir,
      this.visibility,
      this.speed});
  final int? speed;
  final int? visibility;
  final int? pressure;
  final String? windDir;
  final int? humidity;
  final int? feelslike;
  final Widget? backgroundWidget;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Details"),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: deviceHeight,
              width: deviceWidth,
              child: backgroundWidget,
            ),
            Container(
              width: deviceWidth,
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: deviceHeight * 0.24,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20),
                children: [
                  Container(
                    width: deviceWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.wind,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Wind Speed",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          "$speed",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.compass,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Wind Direction",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          windDir.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.thermometer,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Feels Like",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          "$feelslike°",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.gauge,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Pressure",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          "$pressure hPa",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.drop,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Humidity",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          "%$humidity",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.eye,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Visibility",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          "$visibility km",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

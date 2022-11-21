import 'package:case_study/data/model/weather_hive.dart';
import 'package:case_study/locator.dart';
import 'package:case_study/presentation/widgets/weathers_list/bloc/weather_bloc.dart';
import 'package:case_study/product/navigator/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<WeatherHive> box;
void main() async {
  setupLocator();
  await Hive.initFlutter();
  // Hive.registerAdapter()
  Hive.registerAdapter<WeatherHive>(WeatherHiveAdapter());
  box = await Hive.openBox<WeatherHive>('testBox');
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) =>
              WeatherBloc()..add(const FetchWeatherListEvent()),
        ),
      ],
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:case_study/presentation/screens/weather_page.dart';
import 'package:case_study/presentation/widgets/weathers_list/bloc/weather_details.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WeatherPage, initial: true),
    AutoRoute(page: WeatherDetails),
  ],
)
// extend the generated private router
class $AppRouter{}
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:case_study/presentation/widgets/weathers_list/bloc/weather_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('find speed', (WidgetTester tester) async {
    await tester.pumpWidget(const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(body: WeatherDetails(speed: 5)),
      ),
    ));
    final findText = find.text("5");

    expect(findText, findsOneWidget);
  });
}

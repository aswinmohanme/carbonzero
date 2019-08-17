import 'package:carbon/locator.dart';
import 'package:carbon/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:carbon/ui/themes.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildCarbonZeroThemeFromBrightness(
          Theme.of(context).brightness, Theme.of(context)),
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/',
    );
  }
}

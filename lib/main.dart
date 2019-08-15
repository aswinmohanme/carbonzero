import 'package:carbon/locator.dart';
import 'package:carbon/ui/router.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/',
    );
  }
}

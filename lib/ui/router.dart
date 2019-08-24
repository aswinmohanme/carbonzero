import 'package:carbon/ui/screens/home_screen.dart';
import 'package:carbon/ui/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case '/news':
        return MaterialPageRoute(
            builder: (BuildContext context) => NewsScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route Defined"),
                  ),
                ));
    }
  }
}

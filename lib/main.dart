import 'package:carbon/locator.dart';
import 'package:carbon/ui/components/no_scroll_glow.dart';
import 'package:carbon/ui/router.dart';
import 'package:carbon/ui/screens/home_screen.dart';
import 'package:carbon/ui/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:carbon/ui/themes.dart';
import 'package:typicons_flutter/typicons.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentScreenIndex = 1;
  final screens = [HomeScreen(), HomeScreen(), NewsScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: child,
        );
      },
      theme: buildCarbonZeroThemeFromBrightness(
          Theme.of(context).brightness, Theme.of(context)),
      home: Scaffold(
        body: screens[currentScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreenIndex,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).backgroundColor,
          unselectedItemColor: Theme.of(context).backgroundColor,
          showSelectedLabels: false,
          onTap: (int index) {
            setState(() {
              currentScreenIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Typicons.infinity), title: Text("Feed")),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(Typicons.compass),
                title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Typicons.news), title: Text("News")),
          ],
        ),
      ),
    );
  }
}

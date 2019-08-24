import 'package:carbon/ui/screens/home_screen.dart';
import 'package:carbon/ui/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons.dart';

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  int currentScreenIndex = 1;
  final screens = [HomeScreen(), HomeScreen(), NewsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

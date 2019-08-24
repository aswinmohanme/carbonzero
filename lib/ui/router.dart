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
  final screens = [HomeScreen(), HomeScreen(), NewsScreen(), NewsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        onTap: (int index) {
          setState(() {
            currentScreenIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Typicons.infinity,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text("Feed")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Typicons.compass,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text("Actions")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Typicons.news,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text("News")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Typicons.user,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text("Profile")),
        ],
      ),
    );
  }
}

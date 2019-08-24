import 'package:carbon/locator.dart';
import 'package:carbon/ui/components/no_scroll_glow.dart';
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
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: child,
        );
      },
      theme: buildCarbonZeroThemeFromBrightness(
          Theme.of(context).brightness, Theme.of(context)),
      home: Router(),
    );
  }
}

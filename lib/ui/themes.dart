// Themes
import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';

ThemeData buildCarbonZeroThemeFromBrightness(
    Brightness brightness, ThemeData base) {
  return brightness == Brightness.light
      ? _buildCarbonZeroThemeLight(base)
      : _buildCarbonZeroThemeDark(base);
}

ThemeData _buildCarbonZeroTheme(ThemeData base) {
  return base.copyWith(
    textTheme: _buildCarbonZeroTextTheme(base.textTheme),
  );
}

TextTheme _buildCarbonZeroTextTheme(TextTheme textTheme) {
  return textTheme
      .copyWith(
          body1: textTheme.body1.copyWith(fontSize: text_lg),
          headline: textTheme.headline.copyWith(fontSize: text_2xl),
          caption: textTheme.subtitle
              .copyWith(fontSize: text_sm)
              .apply(color: grayDarkText),
          subhead: textTheme.subtitle.copyWith(fontSize: text_lg),
          subtitle: textTheme.subtitle.copyWith(fontSize: text_base),
          display1: textTheme.display1.copyWith(fontSize: text_xl),
          display2: textTheme.display2.copyWith(fontSize: text_2xl),
          display3: textTheme.display3.copyWith(fontSize: text_3xl))
      .apply(fontFamily: 'Jost');
}

ThemeData _buildCarbonZeroThemeLight(ThemeData base) {
  return _buildCarbonZeroTheme(base).copyWith(
      brightness: Brightness.light,
      unselectedWidgetColor: darkColor,
      primaryColor: darkColor,
      accentColor: darkColor,
      hintColor: darkColor,
      backgroundColor: lightColor,
      textTheme: _buildCarbonZeroTextTheme(base.textTheme)
          .apply(bodyColor: darkColor, displayColor: darkColor));
}

ThemeData _buildCarbonZeroThemeDark(ThemeData base) {
  return _buildCarbonZeroTheme(base).copyWith(
      brightness: Brightness.dark,
      unselectedWidgetColor: lightColor,
      backgroundColor: darkColor,
      primaryColor: lightColor,
      accentColor: lightColor,
      hintColor: lightColor,
      textTheme: _buildCarbonZeroTextTheme(base.textTheme)
          .apply(bodyColor: lightColor, displayColor: lightColor));
}

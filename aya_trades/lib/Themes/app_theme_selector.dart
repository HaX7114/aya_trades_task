import 'package:aya_trades/Themes/dark_theme.dart';
import 'package:aya_trades/Themes/light_theme.dart';
import 'package:aya_trades/Themes/the_app_theme.dart';

class AppThemeSelector {
  final LightThemeData _lightTheme = LightThemeData();
  final DarkThemeData _darkTheme = DarkThemeData();

  static String setLightTheme = "Light";
  static String setDarkTheme = "Dark";

  TheAppThemeData setAppTheme(String selectTheme) {
    if (selectTheme == setLightTheme) {
      return _lightTheme;
    } else {
      return _darkTheme;
    }
  }
}

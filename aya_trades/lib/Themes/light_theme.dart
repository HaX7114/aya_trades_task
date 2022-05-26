import 'package:aya_trades/Constants/constants.dart';
import 'package:aya_trades/Themes/the_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightThemeData extends TheAppThemeData {
  @override
  Color getBackGroundColor() => backGroundColor = K_whiteColor;
  @override
  Color getStatusBarColor() => statusBarColor = K_transparentColor;
  @override
  Color getMainColor() => mainColor = K_blackColor;
  @override
  Color getTextColor() => mainColor = K_whiteColor;
  @override
  Color getButtonColor() => mainColor = K_greenColor;

  @override
  SystemUiOverlayStyle setSystemOverLay() {
    return SystemUiOverlayStyle(
      statusBarColor: getStatusBarColor(), // status bar color
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    );
  }

  @override
  ThemeData setTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(systemOverlayStyle: setSystemOverLay()),
      scaffoldBackgroundColor: getBackGroundColor(),
      primarySwatch: Colors.green,
    );
  }
}

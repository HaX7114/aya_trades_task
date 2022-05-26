import 'package:flutter/material.dart';

abstract class TheAppThemeData {
  late Color backGroundColor;
  late Color mainColor;
  late Color textColor;
  late Color statusBarColor;

  dynamic getBackGroundColor() {}
  dynamic getTextColor() {}
  dynamic getStatusBarColor() {}
  dynamic getMainColor() {}
  dynamic getButtonColor() {}

  //Set the theme data here
  dynamic setTheme() {}

  //Changes the system icons that in the status bar
  dynamic setSystemOverLay() {}
}

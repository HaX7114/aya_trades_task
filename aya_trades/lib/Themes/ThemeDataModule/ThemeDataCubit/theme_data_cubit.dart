import 'package:aya_trades/Themes/ThemeDataModule/ThemeDataCubit/theme_data_states.dart';
import 'package:aya_trades/Themes/app_theme_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeDataCubit extends Cubit<ThemeDataStates> {
  ThemeDataCubit() : super(ThemeDataInitState());

  static ThemeDataCubit get(context) => BlocProvider.of(context);

  String currentTheme = AppThemeSelector.setLightTheme; //Default
  IconData currentThemeIcon = CupertinoIcons.moon;

  void changeTheme() {
    if (currentTheme == AppThemeSelector.setLightTheme) {
      currentThemeIcon = CupertinoIcons.brightness;
      currentTheme = AppThemeSelector.setDarkTheme;
      emit(ThemeDataChangedToDarkState());
    } else {
      currentThemeIcon = CupertinoIcons.moon;
      currentTheme = AppThemeSelector.setLightTheme;
      emit(ThemeDataChangedToLightState());
    }
  }
}

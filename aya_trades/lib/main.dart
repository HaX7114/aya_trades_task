import 'package:aya_trades/Modules/LoginModule/LoginScreen.dart';
import 'package:aya_trades/Themes/ThemeDataModule/ThemeDataCubit/theme_data_cubit.dart';
import 'package:aya_trades/Themes/ThemeDataModule/ThemeDataCubit/theme_data_states.dart';
import 'package:aya_trades/Themes/app_theme_selector.dart';
import 'package:aya_trades/Themes/the_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppThemeSelector appThemeSelector = AppThemeSelector();
late TheAppThemeData theAppThemeData;
ThemeDataCubit themeDataCubit = ThemeDataCubit();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => themeDataCubit,
      child: BlocConsumer<ThemeDataCubit, ThemeDataStates>(
        listener: (context, state) {},
        builder: (context, state) {
          theAppThemeData = appThemeSelector
              .setAppTheme(ThemeDataCubit.get(context).currentTheme); //Default
          return MaterialApp(
            title: 'Aya Trades',
            theme: theAppThemeData.setTheme(),
            home: LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

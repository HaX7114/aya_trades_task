import 'package:aya_trades/Constants/constants.dart';
import 'package:aya_trades/Modules/LoginModule/LoginScreenCubit/login_screen_states.dart';
import 'package:aya_trades/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isLiveLoginSelected = true;
  Color selectedBackColor = K_greenColor;
  Color notSelectedBackColor = K_transparentColor;
  Color selectedTextColor = theAppThemeData.getTextColor();
  Color notSelectedTextColor = K_greenColor;

  String textUpperTheLogin =
      "Ready to start trading with real money?"; //Default

  void changeToLoginLive() {
    isLiveLoginSelected = true;
    textUpperTheLogin = "Ready to start trading with real money?";
    emit(LoginLiveState());
  }

  void changeToPaperTrading() {
    isLiveLoginSelected = false;
    textUpperTheLogin = "Practise with paper trading";
    emit(LoginPaperTradingState());
  }
}

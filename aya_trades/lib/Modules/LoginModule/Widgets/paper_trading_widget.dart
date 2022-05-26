import 'package:aya_trades/Constants/constants.dart';
import 'package:aya_trades/CustomWidgets/my_text.dart';
import 'package:aya_trades/Modules/LoginModule/LoginScreenCubit/login_screen_cubit.dart';
import 'package:flutter/material.dart';

class PaperTradingContainerWidget extends StatelessWidget {
  final LoginCubit loginCubit;
  const PaperTradingContainerWidget({Key? key, required this.loginCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          loginCubit.changeToPaperTrading();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: !loginCubit.isLiveLoginSelected
                ? loginCubit.selectedBackColor
                : loginCubit.notSelectedBackColor,
          ),
          height: 35.0,
          child: Center(
            child: MyText(
              color: !loginCubit.isLiveLoginSelected
                  ? loginCubit.selectedTextColor
                  : loginCubit.notSelectedTextColor,
              text: "Paper Trading",
              size: K_fontSizeM,
            ),
          ),
        ),
      ),
    );
  }
}

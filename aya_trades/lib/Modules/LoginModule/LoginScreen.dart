import 'package:aya_trades/Constants/constants.dart';
import 'package:aya_trades/CustomWidgets/MyTextFieldModule/my_text_field.dart';
import 'package:aya_trades/CustomWidgets/my_button.dart';
import 'package:aya_trades/CustomWidgets/my_text.dart';
import 'package:aya_trades/Modules/LoginModule/LoginScreenCubit/login_screen_cubit.dart';
import 'package:aya_trades/Modules/LoginModule/LoginScreenCubit/login_screen_states.dart';
import 'package:aya_trades/Modules/LoginModule/Widgets/live_container_widget.dart';
import 'package:aya_trades/Modules/LoginModule/Widgets/paper_trading_widget.dart';
import 'package:aya_trades/Modules/LoginModule/Widgets/textfield_with_container.dart';
import 'package:aya_trades/Shared/device_dimensions.dart';
import 'package:aya_trades/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            LoginCubit loginCubit = LoginCubit.get(context);

            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                  backgroundColor: K_transparentColor,
                  elevation: 0.0,
                  actions: [
                    IconButton(
                      color: theAppThemeData.getMainColor(),
                      onPressed: () {
                        themeDataCubit.changeTheme();
                      },
                      icon: Icon(
                        themeDataCubit.currentThemeIcon,
                        size: 30.0,
                      ),
                    )
                  ]),
              body: SingleChildScrollView(
                physics: K_bouncingPhysics,
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/frame.png",
                        fit: BoxFit.cover,
                        //In the dark mode we will the height/Width = 0.0 to hide the image background
                        height: themeDataCubit.currentTheme == "Dark"
                            ? 0.0
                            : DeviceDimensions.getHeightOfDevice(context),
                        width: themeDataCubit.currentTheme == "Dark"
                            ? 0.0
                            : DeviceDimensions.getWidthOfDevice(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: K_mainPadding * 3,
                          left: K_mainPadding,
                          right: K_mainPadding,
                          bottom: K_mainPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.fill,
                                height: 140.0,
                                width: 120.0,
                              ),
                            ),
                            K_vSpace20,
                            K_vSpace10,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: K_offWhiteColor,
                              ),
                              width: DeviceDimensions.getWidthOfDevice(context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    LiveContainerWidget(loginCubit: loginCubit),
                                    K_hSpace20,
                                    PaperTradingContainerWidget(
                                        loginCubit: loginCubit),
                                  ],
                                ),
                              ),
                            ),
                            K_vSpace20,
                            MyText(
                              text: loginCubit.textUpperTheLogin,
                              size: K_fontSizeM,
                              color: loginCubit.isLiveLoginSelected
                                  ? K_greenColor
                                  : theAppThemeData.getMainColor(),
                            ),
                            K_vSpace10,
                            MyText(
                              text: "Log in",
                              size: K_fontSizeL,
                              color: K_greenColor,
                            ),
                            Row(
                              children: [
                                MyText(
                                  text: "Don't have an account ?",
                                  size: K_fontSizeM,
                                  color: theAppThemeData.getMainColor(),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: MyText(
                                    text: "Sign Up",
                                    size: K_fontSizeM,
                                    color: K_greenColor,
                                  ),
                                )
                              ],
                            ),
                            K_vSpace20,
                            TextFieldWithContainer(
                              textField: MyTextField(
                                borderColor: K_transparentColor,
                                hintText: "Username or Email",
                                hintTextColor: K_blackColor.withOpacity(0.5),
                                validatorText: "Email can't be empty!",
                                textController: emailController,
                                labelTextColor: K_blackColor,
                                isEmailField: true,
                              ),
                            ),
                            K_vSpace20,
                            TextFieldWithContainer(
                              textField: MyTextField(
                                borderColor: K_transparentColor,
                                hintText: "Password",
                                labelTextColor: K_blackColor,
                                isPasswordField: true,
                                hintTextColor: K_blackColor.withOpacity(0.5),
                                validatorText: "Password can't be empty!",
                                textController: passwordController,
                              ),
                            ),
                            K_vSpace10,
                            TextButton(
                              onPressed: () {},
                              child: MyText(
                                text: "Forgot your password?",
                                size: K_fontSizeM,
                                color: K_greenColor,
                              ),
                            ),
                            K_vSpace20,
                            Center(
                              child: Container(
                                decoration: BoxDecoration(boxShadow: shadow),
                                child: MyButton(
                                  onPressed: () {},
                                  buttonWidth: 200.0,
                                  height: 55.0,
                                  textSize: K_fontSizeM,
                                  fillColor: K_greenColor,
                                  text: "Login",
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

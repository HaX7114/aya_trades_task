import 'package:aya_trades/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/constants.dart';
import 'MyTextFieldCubit/my_text_field_cubit.dart';
import 'MyTextFieldCubit/my_text_field_states.dart';

class MyTextField extends StatelessWidget {
  final hintText;
  final hintTextColor;
  final isEmailField;
  final isPasswordField;
  final labelText;
  final labelTextColor;
  bool obscureText;
  final prefixIcon;
  Icon? suffixIcon;
  final borderColor;
  final maxLength;
  final borderRadius;
  final validatorText;
  ValueChanged<String>? onChange;
  final TextEditingController textController;

  MyTextField({
    Key? key,
    this.hintText,
    this.hintTextColor,
    this.labelText,
    this.labelTextColor,
    this.maxLength,
    this.isEmailField = false, //default,
    this.isPasswordField = false, //default,
    this.obscureText = false,
    required this.borderColor,
    required this.validatorText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textController,
    this.borderRadius,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFieldCubit(),
      child: BlocConsumer<TextFieldCubit, TextFieldStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TextFieldCubit textFieldCubit = TextFieldCubit.get(context);
          return TextFormField(
            controller: textController,
            obscureText: isPasswordField
                ? !textFieldCubit.obscureText
                : textFieldCubit.obscureText, //If Password hide it
            maxLength: maxLength,
            validator: (value) {
              if (isEmailField) {
                return textFieldCubit.validateEmail(
                    value!, validatorText, textController);
              } else if (isPasswordField) {
                return textFieldCubit.validatePassword(
                    value!, validatorText, textController);
              } else {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
              }
              return null;
            },
            onChanged: onChange,
            style: GoogleFonts.poppins(
              color: labelTextColor ?? theAppThemeData.getMainColor(),
              fontSize: 13.0,
            ),
            cursorColor: K_greenColor,
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: theAppThemeData.getMainColor(),
                    )
                  : null,
              labelText: labelText,
              suffixIcon: isPasswordField
                  ? GestureDetector(
                      child: Icon(textFieldCubit.suffixIcon),
                      onTap: () {
                        textFieldCubit.changeSuffixIcon();
                      },
                    )
                  : null,
              labelStyle: GoogleFonts.poppins(
                color: labelTextColor ?? theAppThemeData.getMainColor(),
                fontSize: 13.0,
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: hintTextColor ?? K_greyColor,
                fontSize: 13.0,
              ),
              errorStyle: GoogleFonts.poppins(
                fontSize: 13.0,
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
                  borderSide: BorderSide(
                    color: borderColor,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
                  borderSide: BorderSide(
                    color: borderColor,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
                  borderSide: const BorderSide(
                    color: K_transparentColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? K_radius),
                  borderSide: const BorderSide(
                    color: K_transparentColor,
                  )),
            ),
          );
        },
      ),
    );
  }
}

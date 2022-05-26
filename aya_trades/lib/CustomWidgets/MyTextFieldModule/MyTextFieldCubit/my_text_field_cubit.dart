import 'package:aya_trades/CustomWidgets/MyTextFieldModule/MyTextFieldCubit/my_text_field_states.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_strength/password_strength.dart';

class TextFieldCubit extends Cubit<TextFieldStates> {
  TextFieldCubit() : super(InitStateOfTextField());

  static TextFieldCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = CupertinoIcons.eye_slash;
  bool obscureText = false;
  Color underLineBorderColor = Colors.black;

  changeSuffixIcon() {
    if (obscureText) {
      obscureText = false;
      suffixIcon = CupertinoIcons.eye_slash;
      emit(SetSuffixIconToEye());
    } else {
      obscureText = true;
      suffixIcon = CupertinoIcons.eye;
      emit(SetSuffixIconToEyeSlash());
    }
  }

  //Validation
  String validatePassword(String password, String validatorText,
      TextEditingController textController) {
    String result;
    if (estimatePasswordStrength(password) <= 0.3 && password.isNotEmpty) {
      result = 'Password should contain numbers and letters !';

      underLineBorderColor = Colors.red;
      emit(SetSuffixIconToFalse());
    } else if (estimatePasswordStrength(password) > 0.3 &&
        password.isNotEmpty) {
      result = '';
      underLineBorderColor = Colors.green;
      emit(SetSuffixIconToTrue());
    } else {
      result = validatorText;
      //Return to default state of text field
      underLineBorderColor = Colors.black;
      emit(InitStateOfTextField()); //Return to default
    }
    return result;
  }

  String validateEmail(String email, String validatorText,
      TextEditingController textController) {
    String result;
    bool isValid = EmailValidator.validate(email.trim(), false, false);
    if (!isValid && email.isNotEmpty) {
      result = 'Email is invalid !';
      underLineBorderColor = Colors.red;
      emit(SetSuffixIconToFalse());
      return result;
    } else if (isValid) {
      result = '';
      underLineBorderColor = Colors.green;
      emit(SetSuffixIconToTrue());
      return result;
    } else {
      result = validatorText;
      //Return to default state of text field
      underLineBorderColor = Colors.black;
      emit(InitStateOfTextField());
      return result;
    }
  }
}

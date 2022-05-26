import 'package:aya_trades/Constants/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWithContainer extends StatelessWidget {
  final textField;
  const TextFieldWithContainer({Key? key, required this.textField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(K_radius),
        color: K_textFieldBackColor,
        boxShadow: shadow,
      ),
      child: textField,
    );
  }
}

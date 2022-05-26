import 'package:aya_trades/Themes/ThemeDataModule/ThemeDataCubit/theme_data_cubit.dart';
import 'package:aya_trades/Themes/ThemeDataModule/ThemeDataCubit/theme_data_states.dart';
import 'package:aya_trades/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final text;
  final size;
  final color;
  final textAlign;
  final fontWeight;
  int? maxLinesNumber;
  bool showEllipsis;

  MyText(
      {Key? key,
      this.maxLinesNumber,
      required this.text,
      required this.size,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.showEllipsis = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => themeDataCubit,
        child: BlocConsumer<ThemeDataCubit, ThemeDataStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Text(
              text,
              textAlign: textAlign,
              maxLines: maxLinesNumber,
              overflow: showEllipsis ? TextOverflow.ellipsis : null,
              style: GoogleFonts.poppins(
                fontSize: size,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? theAppThemeData.getTextColor(),
              ),
            );
          },
        ));
  }
}

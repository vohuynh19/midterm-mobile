import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
    backgroundColor: ColorConstant.backgroundColor,
    primaryColor: ColorConstant.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyleConstant.normalMediumText
            .copyWith(color: const Color.fromRGBO(128, 128, 128, 1))),
    iconTheme: const IconThemeData(color: ColorConstant.buttonColor),
    toggleableActiveColor: const Color.fromRGBO(219, 48, 34, 0.25),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: ColorConstant.primaryColorSchemeColor,
          secondary: ColorConstant.textColor,
          tertiary: ColorConstant.secondaryBackGroundColor,
        ),
  );
}

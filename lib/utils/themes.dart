import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
    backgroundColor: ColorConstant.backgroundColor,
    primaryColor: ColorConstant.primaryColor,
    cardColor: ColorConstant.secondaryColor,
    iconTheme: const IconThemeData(color: ColorConstant.buttonColor),
    colorScheme:
        const ColorScheme.light().copyWith(primary: ColorConstant.primaryColor),
  );
}

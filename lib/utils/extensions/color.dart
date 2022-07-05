import 'package:flutter/material.dart';
import '../color_constant.dart';

extension CustomColorScheme on ColorScheme {
  Color get primaryColor => ColorConstant.primaryColor;
  Color get whiteColor => ColorConstant.backgroundColor;
  Color get blackColor => ColorConstant.textColor;
}

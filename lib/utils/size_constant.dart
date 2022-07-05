import 'package:flutter/material.dart';

class SizeConstant {
  static const double fontSizeVerySmall = 10.0;
  static const double fontSizexSmall = 10.0;
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14;
  static const double fontSizeLarge = 16;
  static const double fontSizexLarge = 18;
  static const double fontSizexxLarge = 20.0;
  static const double fontSizeScreenTitle = 22.0;

  static EdgeInsets screenPadding = const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets symmetricHorizontal(double value) {
    return EdgeInsets.symmetric(horizontal: value);
  }

  static EdgeInsets symmetricVertical(double value) {
    return EdgeInsets.symmetric(vertical: value);
  }
}

import 'package:flutter/widgets.dart';

class SizeConfig {
  late MediaQueryData _data;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation? orientation;

  void init(BuildContext context) {
    _data = MediaQuery.of(context);
    screenWidth = _data.size.width;
    screenHeight = _data.size.height;
    orientation = _data.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}

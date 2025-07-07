import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class CarosTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get captionSmall => TextStyle(
        fontFamily: 'Manrope',
        fontSize: 9.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'aviation_uikit',
      );
  //Test
  CarosTextTheme({this.foregroundColor = Colors.black});
}

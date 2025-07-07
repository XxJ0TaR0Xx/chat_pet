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
      );

  TextStyle get captionMedium => TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
      );

  CarosTextTheme({this.foregroundColor = Colors.black});
}

class CircularStdTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get captionMedium => TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
      );

  TextStyle get captionBook => TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        //TODO think
        package: 'package',
      );

  CircularStdTextTheme({this.foregroundColor = Colors.black});
}

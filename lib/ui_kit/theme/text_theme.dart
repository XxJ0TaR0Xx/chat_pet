import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class CarosTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get medium => TextStyle(
        fontFamily: 'Caros',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'aviation_uikit',
      );

  TextStyle get mixed => TextStyle(
        fontFamily: 'Caros',
        fontSize: 68.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'aviation_uikit',
      );

  TextStyle get bold => TextStyle(
        fontFamily: 'Caros',
        fontSize: 16.w,
        fontWeight: FontWeight.bold,
        color: foregroundColor,
        package: 'aviation_uikit',
      );

  CarosTextTheme({this.foregroundColor = Colors.black});
}

class CircularStdTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get medium => TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'aviation_uikit',
      );

  TextStyle get book => TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'aviation_uikit',
      );

  TextStyle get mixed => TextStyle(
        fontFamily: 'CircularStd',
        fontSize: 14.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'aviation_uikit',
      );

  CircularStdTextTheme({this.foregroundColor = Colors.black});
}

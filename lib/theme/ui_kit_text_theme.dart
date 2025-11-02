import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class UiKitCarosTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get captionSmall => TextStyle(
        fontFamily: 'Caros',
        fontSize: 9.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
      );

  TextStyle get captionMedium => TextStyle(
        fontFamily: 'Caros',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
      );

  UiKitCarosTextTheme({this.foregroundColor = Colors.black});
}

class UiKitCircularStdTextTheme extends UiKitTextTheme {
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

  UiKitCircularStdTextTheme({this.foregroundColor = Colors.black});
}

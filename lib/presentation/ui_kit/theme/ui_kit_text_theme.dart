import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class CarosTextTheme extends UiKitTextTheme {
  CarosTextTheme({this.foregroundColor = Colors.black});
  final Color foregroundColor;

  TextStyle get captionMedium => TextStyle(
    fontFamily: 'Caros',
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    color: foregroundColor,
    package: 'aviation_uikit',
  );

  TextStyle get medium => TextStyle(
    fontFamily: 'Caros',
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    color: foregroundColor,
    package: 'aviation_uikit',
  );

  TextStyle get mediumBold => medium.copyWith(
    fontWeight: FontWeight.bold,
  );

  TextStyle get mediumBold12 => medium.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 12.w,
  );

  TextStyle get mediumBold14 => medium.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 14.w,
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

  TextStyle get boldTitle => TextStyle(
    fontFamily: 'Caros',
    fontSize: 24.w,
    fontWeight: FontWeight.bold,
    color: foregroundColor,
    package: 'aviation_uikit',
  );
}

class CircularStdTextTheme extends UiKitTextTheme {
  CircularStdTextTheme({this.foregroundColor = Colors.black});
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

  TextStyle get bookSmall => book.copyWith(
    fontSize: 12.w,
  );

  TextStyle get bookSmallW600 => book.copyWith(
    fontSize: 12.w,
    fontWeight: FontWeight.w600,
  );

  TextStyle get bookSmall10 => book.copyWith(
    fontSize: 10.w,
  );

  TextStyle get mixed => TextStyle(
    fontFamily: 'CircularStd',
    fontSize: 14.w,
    fontWeight: FontWeight.w400,
    color: foregroundColor,
    package: 'aviation_uikit',
  );
}

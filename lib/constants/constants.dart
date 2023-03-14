import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static String appTitle = "Pokedex";

  static TextStyle getAppTitleTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(40),
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle getPokeListNameTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(25),
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle getPokeListChipTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(20), color: Colors.white);
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return size.sp;
    }
  }

  static TextStyle getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);
  }

  static TextStyle getPokeInfoLabelStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(20),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';

TextStyle bodyStyle([Color? color]) {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: color ?? kcBlackColor);
}

TextStyle bodyBoldStyle([Color? color]) {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: color ?? kcBlackColor);
}

TextStyle headingStyle([Color? color]) {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: color ?? kcBlackColor);
}

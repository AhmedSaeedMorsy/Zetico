import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstance.fontFamily,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );
}

// bold weight
TextStyle getBoldStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

// light weight
TextStyle getLightStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

// medium weight
TextStyle getMediumStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

// regular weight
TextStyle getRegularStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

// semiBold weight
TextStyle getSemiBoldStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main color
    primarySwatch: Colors.green,
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.firstgradientColor,
    primaryColorDark: ColorManager.thirdgradientColor,
    disabledColor: ColorManager.grey,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      shadowColor: ColorManager.firstgradientColor,
      elevation: AppSize.s4,
      titleTextStyle: getRegularStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.white,
      ),
    ),

    //text theme
    textTheme: TextTheme(
      headlineLarge: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s26.sp,
      ),
      bodyMedium: getMediumStyle(
        color: ColorManager.white,
      ),
      displayMedium: getMediumStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSizeManager.s32.sp,
      ),
      bodySmall: getMediumStyle(
        color: ColorManager.white,
      ),
      bodyLarge: getMediumStyle(
        color: ColorManager.darkGrey,
      ),
      displaySmall: getMediumStyle(
        color: ColorManager.lightGrey,
      ),
      labelLarge: getMediumStyle(
        color: ColorManager.black,
      ),
    ),
    // input decoration theme (text form field)
  );
}

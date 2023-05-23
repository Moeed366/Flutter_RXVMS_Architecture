
/*

when need theme:
 style: subtitle2(context).copyWith(fontSize: 30)


*/



import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';


TextStyle bodyText1(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1!.copyWith();
}
TextStyle bodyText2(BuildContext context) {
  return Theme.of(context).textTheme.bodyText2!.copyWith();
}
TextStyle subtitle1(BuildContext context) {
  return Theme.of(context).textTheme.subtitle1!.copyWith();
}
TextStyle headline1(BuildContext context) {
  return Theme.of(context).textTheme.headline1!.copyWith();
}

TextStyle headline2(BuildContext context) {
  return Theme.of(context).textTheme.headline2!.copyWith();
}
TextStyle headline3(BuildContext context) {
  return Theme.of(context).textTheme.headline3!.copyWith();
}
TextStyle headline4(BuildContext context) {
  return Theme.of(context).textTheme.headline4!.copyWith();
}

TextStyle headline5(BuildContext context) {
  return Theme.of(context).textTheme.headline5!.copyWith();
}
TextStyle headline6(BuildContext context) {
  return Theme.of(context).textTheme.headline6!.copyWith();
}








class AppTheme {


  ///=========================================DARK THEME==========================
  static ThemeData dark() {
    return ThemeData(



      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      primaryColor: AppColors.secondaryColor,
      scaffoldBackgroundColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.secondaryColor,
        backgroundColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: AppColors.primaryColor,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
      ),
      textTheme: whiteText,
    );
  }



  ///=========================================LIGHT THEME=========================

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.secondaryColor,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.secondaryColor,
        backgroundColor: AppColors.primaryColor,
      ),
      textTheme: blackText,
    );
  }
  ///================================TEXT LIGHT=================================
  static TextTheme whiteText = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color:AppColors.bodyText1Color_l,
    ),
    bodyText2: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w700,
      color: AppColors.bodyText2Color_l,
    ),
    subtitle1: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
      color: AppColors.subtitle1Color_l,
    ),
    headline1: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.w600,
      color: AppColors.headline1Color_l,
      letterSpacing: 0,
      height: 1.12,
    ),
    headline2: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: AppColors.headline2Color_l,
    ),
    headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.headline3Color_l,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.headline4Color_l,
    ),
    headline5: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.headline5Color_l,
    ),
    headline6: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.headline6Color_l,
    ),
  );
  ///================================TEXT DARK==================================
  static TextTheme blackText = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText1Color_d,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText1Color_d,
    ),
    subtitle1: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.subtitle1Color_d,
    ),
    headline1: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.w600,
      color:  AppColors.headline1Color_d,
      letterSpacing: 0,
      height: 1.12,
    ),
    headline2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color:  AppColors.headline2Color_d,
    ),
    headline3: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: AppColors.headline3Color_d,
    ),
    headline4: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: AppColors.headline4Color_d,
    ),
    headline5: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color:  AppColors.headline5Color_d,
    ),
    headline6: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color:  AppColors.headline6Color_d,
    ),
  );
}


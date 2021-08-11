import 'package:flutter/material.dart';

import 'colors.dart';

class CustomsThemes {
  CustomsThemes();

  static final defaultThemeData = ThemeData(
    /// Dialog Color
    colorScheme: ColorScheme.light(
      primary: CustomColors.primaryColor,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    primaryColor: CustomColors.primaryColor,
    accentColor: CustomColors.accentColor,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: CustomColors.primaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,

    /// color of unchecked check box
    unselectedWidgetColor: Colors.black,
    textTheme: const TextTheme(
      /// color black ,size 25 , weight 400
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: CustomColors.yellowDeepColor,
      ),

      ///color black ,size 16 , weight 500
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CustomColors.yellowDeepColor,
      ),

      ///color brown,size 12 , weight 400 (brown small)
      headline3: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomColors.primaryColor,
      ),

      ///color brown,size 12 , weight 800 (brown small bold)
      headline4: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: CustomColors.primaryColor,
      ),

      ///color brown,size 18 , weight 400 (brown medium)
      headline5: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: CustomColors.primaryColor,
      ),

      ///color brown,size 16 , weight 800 (brown medium bold)
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: CustomColors.primaryColor,
      ),

      ///color lightBrown,size 16 , weight 800 (lightBrown medium bold)
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: CustomColors.accentColor,
      ),

      ///color lightBrown,size 16 , weight 400 (lightBrown medium)
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: CustomColors.accentColor,
      ),

      ///color yellow,size 16 , weight 800 (yellow medium bold)
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),

      ///color grey,size 12 , weight 400 (grey small)
      subtitle1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomColors.greyColor,
      ),

      ///color blue,size 12 , weight 400 (blue small)
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),

      ///color blue,size 12 , weight 500 (blue medium)
      overline: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        // overlayColor: MaterialStateProperty.all(
        //   Colors.transparent,
        // ),
        foregroundColor: MaterialStateProperty.all(
          CustomColors.primaryColor,
        ),
        backgroundColor: MaterialStateProperty.all(
          CustomColors.primaryColor,
        ),
      ),
    ),
  );
}

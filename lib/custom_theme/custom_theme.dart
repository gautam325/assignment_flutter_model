import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      cardTheme: CardTheme(
        elevation: 20,
        color: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
      ),
      popupMenuTheme: PopupMenuThemeData(
          textStyle: TextStyle(
            fontSize: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          titleMedium: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
          labelSmall: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
        ),
        cardTheme: CardTheme(
          elevation: 20,
          color: Colors.grey[850],
          shadowColor: Colors.black.withOpacity(0.5),
        ),
        appBarTheme: AppBarTheme(
          toolbarHeight: 70,
          titleTextStyle: TextStyle(fontSize: 25, color: Colors.white),
        ),
        popupMenuTheme: PopupMenuThemeData(
            textStyle: TextStyle(
              fontSize: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )));
  }
}

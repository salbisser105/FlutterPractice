import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Primary color
    primaryColor: Colors.green,
    //TxtButton Theme
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
    appBarTheme: const AppBarTheme(color: Colors.green, elevation: 0),

    //Floating ActionButtons
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primary),
    //Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: Colors.green, shape: const StadiumBorder()),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
          borderSide: BorderSide(color: primary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
          borderSide: BorderSide(color: primary)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
          borderSide: BorderSide(color: primary)),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //Primary color
      primaryColor: Colors.green,
      appBarTheme: const AppBarTheme(color: Colors.green, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}

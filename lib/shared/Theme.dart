import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

ThemeData LightTheme = ThemeData(
  primarySwatch: Colors.cyan,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    iconSize: 50,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.cyan,
    unselectedItemColor: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.grey[300],
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300],
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.grey[300],
    // foregroundColor:  Colors.grey[300],
    elevation: 0,
  ),
  // TextStyle
// textTheme:  TextTheme(
//   bodyText1: TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     color: Colors.white,
//   ),
// ),

);

ThemeData DarkTheme = ThemeData(
  primarySwatch: Colors.cyan,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    iconSize: 50,
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300],
      statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarColor: Colors.grey[300],
      // systemNavigationBarIconBrightness: Brightness.light,
      // systemNavigationBarDividerColor: Colors.grey[300],
      // systemStatusBarContrastEnforced: true,
      // systemNavigationBarContrastEnforced: true,
    ),
    backgroundColor: Colors.grey[300],
    // foregroundColor:  Colors.grey[300],
    elevation: 0,
  ),
  // TextStyle
// textTheme:  TextTheme(
//   bodyText1: TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     color: Colors.white,
//   ),
// ),
);

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(

             scaffoldBackgroundColor: Colors.black,
             primarySwatch: defultColor,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
                ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,

                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                 unselectedItemColor: Colors.grey,
                elevation: 30,
                backgroundColor: HexColor('333739'), 
               ),
              textTheme: TextTheme(
                bodyText1:TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ), 
              ),
            );

ThemeData lightTheme = ThemeData(
              primarySwatch: defultColor,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: defultColor,
                ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                 unselectedItemColor: Colors.grey,
                elevation: 30,
                backgroundColor: Colors.white, 
              ),
             textTheme: TextTheme(
                bodyText1:TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ), 
              ),
            
            );
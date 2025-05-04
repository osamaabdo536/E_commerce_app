import 'package:flutter/material.dart';

class MyTheme {
  static Color black = Color(0xff383838);
  static Color primaryColor = Color(0xff004182);
  static Color white = Colors.white;
  static Color grey = Color(0xffC8C9CB);
  static Color black70 = Color.fromRGBO(0, 0, 0, 0.7);



  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: MyTheme.primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: black),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primaryColor,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(size: 30),
    ),
  );
}

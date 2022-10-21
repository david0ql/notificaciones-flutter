import 'package:flutter/material.dart';

class UserTheme {
  static const Color primaryColor = Color(0xFFfff2cc);
  static const Color secondColor = Color(0XFF893e38);
  static ThemeData userTheme = ThemeData.light().copyWith(
      //Scaffold
      scaffoldBackgroundColor: primaryColor,
      //AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      //BottomNavigation
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: secondColor,
        backgroundColor: Colors.white,
      ));
}

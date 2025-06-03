import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide:  BorderSide(
          color: color,
          width: 2.0 ,
  ),
   borderRadius: BorderRadius.circular(15)
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor : Pallete.backgroundColor,
    inputDecorationTheme :  InputDecorationTheme(
      contentPadding: EdgeInsets.all(12),
      enabledBorder: _border(Pallete.borderColor),
      focusedBorder: _border(Pallete.gradient1),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: Pallete.gradient1,
      )
    )
  );
  
}

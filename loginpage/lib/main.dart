import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';
import 'package:loginpage/core/theme/theme.dart';
import 'package:loginpage/loginpage.dart';
import 'package:loginpage/otppage.dart';
// import 'package:loginpage/signuppage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode.copyWith(
        scaffoldBackgroundColor : Pallete.backgroundColor,
      ),
      home: const Loginpage(),
    );
  }
}
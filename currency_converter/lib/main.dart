import 'package:currency_converter/material_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(CupertinoCurrencyConverter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CurrencyConverterApp(),
    );
  }
}

class CupertinoCurrencyConverter extends StatelessWidget {
  const CupertinoCurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterApp(),
    );
  }
}

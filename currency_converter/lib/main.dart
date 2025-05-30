import 'package:currency_converter/material_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

// class CupertinoCurrencyConverter extends StatelessWidget {
//   const CupertinoCurrencyConverter({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       home: CurrencyConverterApp(),
//     );
//   }
// }

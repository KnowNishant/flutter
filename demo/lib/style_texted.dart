import 'package:flutter/material.dart';

class StyleTexted extends StatelessWidget {
  const StyleTexted({super.key});
  @override
  Widget build(context) {
    return Text(
      'hello root',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    );
  }
}

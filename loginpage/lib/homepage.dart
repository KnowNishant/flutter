

import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';

class Homepage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const Homepage());
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         'Sucess',
        style: TextStyle(
          fontSize: 20,
          color: Pallete.whiteColor,
        ),
        ),
      ),
      body: Center(
        child: Text('Success',
        style: TextStyle(
          color: Pallete.greenColor,
          fontSize: 36
        ),
        ),
      ),
    );
  }
}
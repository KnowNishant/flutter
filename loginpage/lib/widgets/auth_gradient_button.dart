import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 202, 228, 72),
            Color.fromARGB(255, 173, 214, 60),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 50),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child: Text(
          "Register",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color:const Color.fromARGB(255, 8, 8, 8) ),
        ),
      ),
    );
  }
}

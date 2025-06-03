import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';
import 'package:flutter/services.dart';


class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  // final bool isObsureText;
  final bool isNumberField;
  final String? Function(String?)? validator;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isNumberField = false,
    this.validator,
    // this.isObsureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Pallete.gradient1 ),
      keyboardType: isNumberField? TextInputType.number : TextInputType.text,
      inputFormatters: isNumberField
    ? [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ]
    : [],
      decoration: InputDecoration(hintText: hintText),
      validator: validator,
      // obscureText: isObsureText,
    );
  }
}

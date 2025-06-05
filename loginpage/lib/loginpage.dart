import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';
import 'package:loginpage/core/theme/theme.dart';
import 'package:loginpage/otppage.dart';
import 'package:loginpage/signuppage.dart';
import 'package:loginpage/widgets/auth_gradient_button.dart';
import 'package:loginpage/widgets/custom_field.dart';

class Loginpage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Loginpage());

  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final mobileNoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobileNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, left: 20, bottom: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D253F), Color(0xFF203A4C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.centerLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(Icons.arrow_back, color: Colors.white),
                  // SizedBox(height: 20),
                  Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Log in to your account",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomField(
                      hintText: 'Mobile No',
                      controller: mobileNoController,
                      isNumberField: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mobile number';
                        } else if (value.length != 10) {
                          return 'Mobile number must be 10 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    AuthGradientButton(
                      buttonText: "Send OTP",
                      onPressed: () {
                        //here another logic needs to be implemented for checking if user mobile no exists or not
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(context, Otppage.route());
                        }
                      },
                    ), // here i will use onpressed which will direct to otppage
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, Signuppage.route());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Pallete.gradient1),
                          children: [
                            TextSpan(
                              text: " Register",
                              style: TextStyle(
                                color: Color.fromARGB(255, 202, 228, 72),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

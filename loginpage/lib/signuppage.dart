import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';
import 'package:loginpage/core/theme/theme.dart';
import 'package:loginpage/loginpage.dart';
import 'package:loginpage/widgets/auth_gradient_button.dart';
import 'package:loginpage/widgets/custom_field.dart';

class Signuppage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Signuppage());
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final employeeIdController = TextEditingController();
  final mobileNoController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    employeeIdController.dispose();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, Loginpage.route());
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Create your account",
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
                      hintText: 'Name',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        } else if (value.trim().length < 3) {
                          return 'Name should be at least 3 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomField(
                      hintText: 'Employee Id',
                      controller: employeeIdController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your employee ID';
                        } else if (value.length < 4) {
                          return 'Employee ID must be at least 4 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomField(
                      hintText: 'Company Email',
                      controller: emailController,
                      validator: (value) {
                        if (value == null|| value.trim().isEmpty) {
                          return "Please enter your email Id";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
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
                      buttonText: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // here user will only be registerd if all field are filled
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, Loginpage.route());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'I have an account?',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Pallete.gradient1),
                          children: [
                            TextSpan(
                              text: " Login",
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

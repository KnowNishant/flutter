import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/core/theme/app_pallete.dart';
import 'package:loginpage/homepage.dart';
import 'package:loginpage/loginpage.dart';
import 'package:loginpage/widgets/auth_gradient_button.dart';
import 'package:pinput/pinput.dart';

class Otppage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Otppage());
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  final int _correctOtp = 123456;
  String _enteredOtp = '';
  int _secondsRemaining = 30;
  Timer? _timer;

  void startTimer() {
    _secondsRemaining = 30;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void resendOtp() {
    // I can later trigger API call here to resend OTP
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("OTP has been resent ✅")));
    startTimer();
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
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, Loginpage.route());
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Enter your OTP",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Pinput(
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 7, 7, 7),
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    //  color: Color(0xFF1E2A38),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                keyboardType: TextInputType.number,
                length: 6,
                onChanged: (value) {
                  _enteredOtp =value; // here i am storing user inputted otp in my variable private enteredotp
                },
              ),
            ),
            SizedBox(height: 5),
            AuthGradientButton(
              buttonText: "Verify and Proceed",
              onPressed: () {
                if (_enteredOtp == _correctOtp.toString()) {
                  Navigator.push(context, Homepage.route());
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Invalid OTP ❌')));
                }
              },
            ),

            SizedBox(height: 40),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Didn\'t you receive any code ?\n',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Pallete.gradient1),

                children: [
                  WidgetSpan(child: SizedBox(height: 25)),
                  TextSpan(
                    text: _secondsRemaining > 0
                        ? 'Resend in $_secondsRemaining sec'
                        : 'RESEND NEW CODE',
                    style: TextStyle(color: Color.fromARGB(255, 166, 187, 59)),
                    recognizer: _secondsRemaining == 0
                        ? (TapGestureRecognizer()..onTap = resendOtp)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

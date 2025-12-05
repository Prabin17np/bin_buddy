import 'dart:async';
import 'package:flutter/material.dart';
// <-- onboarding Screen import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to WelcomeScreen after 3 seconds
    // Timer(const Duration(seconds: 3), () {
    //   if (context.mounted) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Logo (same style as your classmate)
              Image.asset(
                "assets/images/logo.jpg", // <-- Your logo
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.contain,
              ),

              // App Title (optional)
              Text(
                "Buddy App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
